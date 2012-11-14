Feature: Testing the Form Attributes API

    Scenario: Creating a new Attribute
        Given that I want to make a new "Attribute"
        And that the request "data" is:
            """
            {
                "form_group_id":1,
                "key":"new",
                "label":"Full Name",
                "type":"varchar",
                "input":"text",
                "required":true,
                "priority":1
            }
            """
        When I request "/forms/1/attributes"
        Then the response is JSON
        And the response has a "id" property
        And the type of the "id" property is numeric
        Then the response status code should be 200

    Scenario: Updating a Attribute
        Given that I want to update a "Attribute"
        And that the request "data" is:
            """
            {
                "form_group_id":1,
                "key":"updated",
                "label":"Full Name Updated",
                "type":"varchar",
                "input":"text",
                "required":true,
                "priority":1
            }
            """
        And that its "id" is "1"
        When I request "/forms/1/attributes"
        Then the response is JSON
        And the response has a "id" property
        And the type of the "id" property is numeric
        And the "id" property equals "1"
        And the response has a "label" property
        And the "label" property equals "Full Name Updated"
        Then the response status code should be 200

    Scenario: Listing All Attributes
        Given that I want to get all "Attributes"
        When I request "/forms/1/attributes"
        Then the response is JSON
        And the response has a "count" property
        And the type of the "count" property is numeric
        Then the response status code should be 200

    Scenario: Finding a Attribute
        Given that I want to find a "Attribute"
        And that its "id" is "1"
        When I request "/forms/1/attributes"
        Then the response is JSON
        And the response has a "id" property
        And the type of the "id" property is numeric
        Then the response status code should be 200

    Scenario: Deleting a Attribute
        Given that I want to delete a "Attribute"
        And that its "id" is "1"
        When I request "/forms/1/attributes"
        Then the response status code should be 200