Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id EA3FB7D908
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id h18so2545439wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=4EUwk2+FasDhqSqbjG3k0x2bgttmiAWym/EtRZKFHZo=;
	b=tJEg+upujE3KG1LzG9SweGWDDnvm9Kugq01spBtiiE0iu5l99v1DoqCvak10yr9Rjx
	MjjhZcluL68ZIgpgzja1OPb2ceUV0kFyetm9441LW1goCoCZajha6PcGRV04gvc9WuwG
	QYMGF+TkZYIwiNi+W8OcpISSf8tUZ4rD7/z9PdIorsTB3DvdlyVAmVGAB78ia+uhGt3m
	/aQZr0Fd6dCKPuQ7l3NzdE4WHCgOQTakxlUUujNDyGMKk7XOhaP4vll5uV8ImCg+4tDw
	mvtrt2zuHIRm9THLaUd0PhoHlEXS9kL2z4v52VpgVA2iCB+eSXHIHIzlAvxHlcITd8Du
	HlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=4EUwk2+FasDhqSqbjG3k0x2bgttmiAWym/EtRZKFHZo=;
	b=VDWI3S96ay+bokZjc6DaLctzlJxKZF2fd4DaJSNNNLiBARSJ1l4+aaON0pXnv0Z/ir
	rnjEN1P7Fh/fucfz4GC5ecW+Jd9QCiqzlSWzMM3YKg8vkBAXuyfhTcmH1QtMtoJFjRTt
	hn3vwlQs+YifSHbfIQNZqpiQJsIWXt/yMQAkI7uID2/gCCkvF4UDWQ6E/zfWACNSdX2x
	qgCjmSZ6xFzHHMjwmTmbqHMg9raSnW71J+DelrJVH3kDbQlUngmoJQQpC8dRCrU3RuU1
	SAnfEU4qgCDfrFrNeARc40j2FgatJZUGCyXHoD5MqQzEVKIKIRmRbBXzEmpTR03bdW7Y
	MD9Q==
X-Gm-Message-State: APjAAAUldLVxwQHXN6VfwvXG0lRNB3/hkfj/z3Me38iH2dFF8YIWWLy6
	H01t70jr1yr0eQ3nNZYtFNJdr4jR03w=
X-Google-Smtp-Source: APXvYqw/zfZVaiyhSeSvb2SIgL4j2mEHFqR/no3jXeSzrfioCxFoc1Z11nwitXxpuEW3izljjB/I6w==
X-Received: by 2002:a1c:55c3:: with SMTP id j186mr2872247wmb.127.1554901937568;
	Wed, 10 Apr 2019 06:12:17 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:30 +0530
Message-Id: <73f5446c38a5d7766c81cda7a7bb22df9cfe0f23.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 11/33] oeqa/manual/toaster: transfer manual toaster test cases to oeqa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 13:12:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

As part of the solution to replace Testopia, manual test cases
need to be migrated to OEQA. These manual test case json files
will serve two use cases.

Use case#1: as input to the future commandline-based manual test
runner script, where this script will display actions and expected
result information in user friendly text, then it will capture
user input for test result and log, finally it will write test
result and log into existing standardize test result json format
from OEQA framework for automated tests.

Use case#2: QA will open and read these json file manually for
planning manual test execution. Any reader interested in
understanding manual test cases will open and read these files.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json   | 2572 ++++++++++++++++++++++
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json | 1170 ++++++++++
 2 files changed, 3742 insertions(+)
 create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.json
 create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mode.json

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
new file mode 100644
index 0000000..ba0658f
--- /dev/null
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -0,0 +1,2572 @@
+[
+  {
+    "test": {
+      "@alias": "toaster.toaster.All_layers:_default_view",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table.",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"View compatible layers\" link situated on the right-hand side, mid-page, under the \"Project configuration\" menu, in the \"Layers\" table.",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the table is populated with the default layers (eg. meta-yocto-bsp, meta-yocto)",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that by default the following columns are shown: Layer, Summary, Revision, Dependencies and Add/Delete",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that the \"Revision\" entries match the release entry from the main project page, in the project details section.",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Check that only one instance of the core layers (openembedded-core, meta-yocto and meta-yocto-bsp) shows in this table, and that instance has a branch that matches the selected project release from the main project page.",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Check that in the \"Dependencies\" column some of the layers should have a square box with a number in it. When clicking on it, a small popup should appear containing a list of other layers required for this layer to work. Every layer listed here should also be a link to the layer's detail page. \n \n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "From the \"Edit columns\" menu, activate the \"Git repository URL\" and the \"Subdirectory\" columns. In \"Git repository URL\": all the entries should have a link to the external site where the layer was  downloaded from.  Similarly, in \"Subdirectory\" links should exist, if a subdirectory entry is present.",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "All_layers:_default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.All_layers:_Add/delete_layers",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"View compatible layers\" link situated on the right-hand side, mid-page, under the \"Project configuration\" menus, in the \"Layers\" table.  \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the Add/delete column is enabled. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Add a new layer \nPick a layer that hasn't been added to the project. \n \nClick on the \"Add layer\" button present in the \"Add/delete\" column. \nIf the layer has unsatisfied dependencies a dialog will appear listing the dependencies (in alphabetical order), each of them with a checkbox so that you can select / deselect them. All checkboxes are checked by default. If you click the \"Cancel\" button the dialog closes. If you click the \"Add layers\" button, the layers are added to the project. \n\nMake sure to uncheck at least 1 of the dependencies so you can check that only the checked dependencies are added, and not the unchecked one(s). ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that the \"Add layer\" button fades out and is replaced temporarily by a message like \"1 layer added\" and then it is replaced by the \"Delete layer\" button. \nCheck that a confirmation message is displayed at the top of the page similar to \"You have added 1 layer to project_name_here: meta-yocto-bsp\". \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Delete an existing layer \nPick a layer that's already been added to the project. \nClick on the \"Delete layer\" button present in the \"Add/delete\" column. \nCheck that once the button is pressed, it fades out and is replaced temporarily by the message \"1 layer deleted\" and then it is replaced by the \"Add layer\" button. \nCheck that a confirmation is displayed at the top of the page similar to \"You have deleted 1 layer from project_name_here: meta-yocto-bsp\". ",
+          "expected_results": "All actions should complete successfully."
+        }
+      },
+      "summary": "All_layers:_Add/delete_layers"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.All_targets:_Default_view",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": " If no images exist in the project, build an image by inserting \"core-image-minimal\" in the \"Recipes\" field and press the \"Build\" button. Wait for the image to finish building. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "On the project page click on the \"Image Recipes\" link situated in the left-handed side of the page, under the \"Project configuration\" menus, in the \"COMPATIBLE METADATA\" table. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that \"Compatible image recipes\" table is populated. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that the following columns are shown by default: \n\t\tImage recipe \n\t\tDescription \n \n\t\tLayer \n\t\tBuild \n\t\t     Version ",
+          "expected_results": ""
+        }
+      },
+      "summary": "All_targets:_Default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Configuration_variables:_default_view",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table.  \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In the main project page, click on \"BitBake variables\" in the left-hand side of the page, under the \"CONFIGURATION\" menu.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that under the \"Add variable\" section, the \"Variable\" field has the default text \"Type variable name\" present, the \"Value\" field has the default text \"Type variable value\" present and that the \"Add variable\" button is inactive. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that under the \"Add variable\" section, there is text present that describes the variables that Toaster cannot modify. ",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Configuration_variables:_default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Configuration_variables:_Test_UI_elements",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In the main project page, click on \"BitBake variables\" in the left-hand side of the page, under the \"CONFIGURATION\" menu. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "DISTRO: \n\t- check that the \"change\" icon is present (represented by a pen icon) \n\t- click on the \"change\" icon and check that the variable becomes an editable text field, populated with the current value of the variable \n\t- check that, if you delete the content of the text field, the save button is disabled \n\t- enter a distro name containing spaces (for example, \"poky tiny\") - check that an error message is shown explaining that the value entered cannot contain spaces  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "IMAGE_FSTYPES: \n\t- check that the \"change\" icon is present (represented by a pen icon) \n\t- click on the \"change\" icon and check that the variable becomes editable like so: the main input control is a set of checkboxes. There is a checkbox for each supported image type. The checkboxes are listed in ascending alphabetical order, broken down in 2 groups: \n\t\t",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "The selected types are checked and listed at the top \n\t\t",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "The other types are not checked and listed afterwards \n\t- check that all this is inside a scrollable div, and a text field is present above that filters out the content of the div as you type. \n\t- check that if there are no image types matching your typed string, a message is shown notifying you of this: \"No image types found\" \n\t- unselect all checkboxes and check that the save button is disabled and a message is shown: \"You must select at least one image type\" \n\t- select different checkboxes and hit save then make sure that the \tsaved value is consistent with the selected checkboxes  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "IMAGE_INSTALL_append: \n\t- check that the \"change\" icon is present (represented by a pen icon) \n\t- click on the \"change\" icon and check that the variable becomes a text field, populated with the current value of the variable.  \n\n\t- check that the save button is disabled when the text field is empty \n\t- insert test in the text field (for example \"package1\") and hit save; be aware that there is no input validation for this variable \n\t- check that a new \"delete\" icon(a trashcan) has appeared next to the pen icon \n\t- check that clicking on the trashcan icon resets the value to \"Not set\" and makes the trashcan icon dissapear  \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "PACKAGE_CLASSES: \n\t- check that the \"change\" icon is present (represented by a pen icon) \n\t- click on the \"change\" icon and check that the variable becomes editable with the following components: \n\t\t",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "A dropdown menu with values 'package_dev', 'package_ipk' and 'package_rpm' in this order. The value selected when you enter the editable state matches the first value of the variable (e.g. if the value is set to 'package_dev package_ipk' the value selected is 'package_dev').  \n \n\t\t",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "Two checkboxes, showing the 2 unselected values in the dropdown menu.  \n\n\t- verify that the checkboxes are checked or unchecked to reflect the variable value (e.g. if the value is set to 'package_dev package_ipk', the 'package_ipk' checkbox is checked, and the 'package_rpm' checkbox is unchecked).  \n\n\tBoth checkboxes can be unchecked.  The value of the checkboxes changes dynamically as I change the selected value in the dropdown menu. This means that any changes to the dropdown menu should uncheck the checkboxes.  \n\n\t- click on save and check that the  value selected in the dropdown menu is the first value in the variable, followed by any checked checkboxes.  \n\n\n",
+          "expected_results": ""
+        },
+        "11": {
+          "action": "Adding variables: \n\t- check that the \"add variable\" form has 2 text fields: one for the variable name and a second one for the variable value, plus an \"add\" button that is disabled until both text fields have some input in them.  \n \n\t- check variable name validation: variable names cannot have spaces, and can only include letters, numbers, underscores and dashes; variable names entered cannot match the name of a variable already on the list; variable names cannot match the blacklisted variables mentioned in the text on the right-hand side of the page  \n\n\t - check that an error message is shown indicating validation has failed and why once you try to put in the value or click on the \"Add variable\" button  ",
+          "expected_results": "All mentioned elements should be present and functional."
+        },
+        "12": {
+          "action": "insert a valid combination and click on \"Add variable\"; check that a new variable/value pair is added at the bottom of the variable list and that the text fields in the \"add variable\" form are cleared and the \"add\" button is disabled \n\t- check that the added variable has a \"change\" icon present next to the variable value, and also that a \"delete\" icon is present next to the variable name \n\t- check that clicking the \"change\" icon makes the variable editable in a text field containing the value of the variable \n\t- check that, if you delete the content of the text field, the save button is\tdisabled\n\t- check that clicking on the \"delete\" button causes both the variable name and the variable value to be removed from the variables list",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Configuration_variables:_Test_UI_elements"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Project_builds:_Default_view",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"Builds\" , next to the \"Configuration\" Button. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the page heading includes a counter with the number of builds run for the project(eg. \"Project builds (4)\"). \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that the following table heads are visible by default: outcome, completed on, failed tasks, errors, warnings, image files. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that by default the table is sorted by \"Completed on\" in descending order",
+          "expected_results": "All mentioned elements should be present."
+        }
+      },
+      "summary": "Project_builds:_Default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Project_builds:_Sorting_the_project_builds_table",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View all project builds\" link situated below the top-most \"Build\" button and text field, next to the \"View all targets\" link \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Verify that, by default, the table is sorted by \"Completed on\" in descending order. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Activate all columns from the \"Edit columns\" table. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that the following columns are sortable, both in ascending and descending order: outcome, target, machine, started on, completed on, warning, project \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Verify that hiding a column that is currently being used as the sorting criteria causes the sorting to reset to the default - i.e \"Completed on\" in descending order.",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Project_builds:_Sorting_the_project_builds_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Project_builds:_customize_the_columns_of_the_table",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View all project builds\" link situated below the top-most \"Build\" button and text field, next to the \"View all targets\" link \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Click on the \"Edit column\" menu and check that the selected columns match the columns currently being shown. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that the following columns cannot be removed from the shown columns: completed on, outcome, recipe \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that unchecked items changed to checked immediately appear in the table and that checked items changed to unchecked immediately disappear from the table.",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Project_builds:_customize_the_columns_of_the_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Project_builds:_filter_the_contents_of_the_table",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View all project builds\" link situated below the top-most \"Build\" button and text field, next to the \"View all targets\" link. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Make sure the following columns have filters: outcome, started on, completed on, failed tasks. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Filters are mutually exclusive. Click a filter button of a one column and a filter dialogue occurs. Select a filter item. The filter result would be showed. Then select another filter item of another column and the previously applied filter is overridden by the newly selected filter when a filter from a different column is applied to the table. This filter will override the current filter.\" \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Filters are overridden by search. Run a search query and you can see previous filter results are overridden by the results of the search query.",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Project_builds:_filter_the_contents_of_the_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Project_builds:_search_the_contents_of_the_table",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View all project builds\" link situated below the top-most \"Build\" button and text field, next to the \"View all targets\" link. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "When no search query has been entered, we have placeholder text saying: \"Search builds\". The placeholder text disappears when the first character is typed. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "When a search query has been submitted and results returned: \n-  We keep the search string in the text input field. \n- We provide a \"Clear search\" icon (icon-remove-sign). Click it to clear the search and display all packages. \n- We change the page heading to indicate the number of results returned by the search query. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "If your search query returns no results, the page heading changes to \"No packages found\", and we show you an alert with a search form and an option to show all packages. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Searching does not change the state of the table: the same columns remain hidden and the same sorting applied. ",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Project_builds:_search_the_contents_of_the_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Layer_details_page:_Default_view",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View compatible layers\" link situated in the \"Project configuration\" portion of the page, under \"Layers\" table. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Click on a layer (for example \"meta-aarch64\"). Notice that the page is divided into 2 columns: the left one is broken down into tabs; the right one provides information about the layer. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that breadcrumbs exist at the top of the page. Check that they work by clicking on them, then hitting back to return to the layer detail page. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that the page heading includes the layer branch name - it should look something like meta-aarch64(dizzy) if the dizzy branch was selected. The branch name should also be present in the breadcrumbs. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "The \"About\" information: \nit shows summary, description in this order, if not empty. If an information item is empty (like the Summary in the example shown in this page), it does not display. \n \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "The tabs: \nCheck that there are 3 tabs: \"layer details\", \"recipes\", \"machines\" showing up in this order. \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "\"Layer details\" tab: \nCheck that the tab shows: \n- A button to add / remove the layer to / from the project. In this tab, the button labels are\"Add the $layer_name layer to your project\" \"Delete the $layer_name layer from your project\" \n- Some details about the layer: repository URL, repository subdirectory, revision (the branch) and the list of layer dependencies. If any of the above details is blank (most likely, the subdirectory) it does not display.The icons next to the repository and subdirectory information are links to their web instances. Those links should open in a new window. \n\n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "The \"Recipes\" tab: \nCheck that it shows: \n\t",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "A counter in the tab label showing the total number of targets provided by the layer \n\t",
+          "expected_results": ""
+        },
+        "11": {
+          "action": "A button to add / remove the layer to / from the project. In this tab, the button labels are \"Add the $layer_name layer to your project to enable these targets\"/\"Delete the $layer_name layer from your project\" \n\t",
+          "expected_results": ""
+        },
+        "12": {
+          "action": "A recipes table with the following columns: \n \n- Recipe \n- Description: the value of the DESCRIPTION variable. If not set, then the value of the SUMMARY variable. \n- Build recipe, which shows a \"build recipe\" button. The \"build recipe\" button is disabled when the layer is not added to the project. \n\nThe recipes table is sorted by \"Recipe\" in ascending alphabetical order. \n\n1",
+          "expected_results": ""
+        },
+        "13": {
+          "action": "The \"Machines\" tab: \n\t",
+          "expected_results": ""
+        },
+        "14": {
+          "action": "A counter in the tab label showing the total number of machines provided by the layer \n\t",
+          "expected_results": ""
+        },
+        "15": {
+          "action": "A button to add/remove the layer to/from the project. In this tab, the button labels are \"Add the $layer_name layer to your project to enable these machines\"/\"Delete the $layer_name layer from your project\" \n\t",
+          "expected_results": ""
+        },
+        "16": {
+          "action": "A machines table with the following columns: \n \n- Machine. \n \n- Description: The value of the DESCRIPTION variable in the .conf file \n- Select machine, which shows a \"select\" button. The \"select\" button is disabled when the layer is not added to the project. \nThe machines table is sorted by \"Machine\" in ascending alphabetical order.  \n",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Layer_details_page:_Default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Layer_details_page:_UI_functionality",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View compatible layers\" link situated in the \"Project configuration\" portion of the page, under \"Layers\" \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Click on a layer (for example \"meta-aarch64\").  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Adding/removing a layer: \nClick on \"Add the $layer_name_here layer to your project\" and verify that the \"Add layer\" button turns into a red button with the label \"Delete the $layer_name_here layer from your project\" and that at the top of the page, below the header, you see a message \"You have added 1 layer to  $project_name_here: $layer_name_here\". This message can be dismissed by clicking on the \"X\" at the top right side of the message. ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Click on the red \"Delete the $layer_name_here from your project\" button and verify that the \"Delete layer\" button turns back into a grey button with the label \"Add the $layer_name_here to your project\" and that at the top of the page, below the header, you see a message \"You have deleted 1 layer to $project_name_here: $layer_name_here\". This message can be dismissed by clicking on the \"X\" at the top right side of the message. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Dependencies window: \n For a layer that has dependencies( for example \"meta-ettus\"), once you click the \"Add layer\" button, verify that you get a message window that presents the dependencies for this layer with the message \"$layer_name_here depends on some layers that are not added to your project. Select the ones you want to add:\", a list with a checkbox for each one and 2 options: \"Add layers\" or \"Cancel\". \nClicking on \"Add layers\" adds all the dependencies and the current layer. Clicking on \"Cancel\" takes you back to the layer detail page without adding any of the layers. \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "\"Recipes\" table \nCheck that if the layer hasn't been added to the project, the \"Build recipe\" button(s) are disabled. After the project is added, check that the \"Build recipe\" button(s) become active and clicking on a button sends you to the main project page and starts a build. \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "\"Machines table\" \nCheck that if the layer hasn't been added to the project, the \"Select machine\" button(s) are disabled.  After the project is added, check that the \"Build machine\" button(s) become active and clicking on a button sends you to the main project page and modifies the project machine to the one selected. ",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Layer_details_page:_UI_functionality"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Importing_new_layers",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table.  \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"Import layer\" link situated in the \"Project configuration\" portion of the page, under \"Layers\" table.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the import layer form is shown, with the following elements as text fields to be filled out: \nLayer name (example: meta-imported) \nGit repository URL (example: git://github.com/shr-distribution/meta-smartphone.git) \nRepository subdirectory (optional) (example: meta-acer) \nRevision (example: master) \n\nIn addition, a separate portion of the form will be the \"Layer dependencies\" portion, where you can add dependency layers for the layer you are importing. This portion will contain a list of dependencies already added, with a trashcan icon next to them that will delete them when pressed and a text field with a \"add layer\" button next to it for adding dependencies. (for example: meta-android, meta-oe) \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "At the bottom of the form, check that a button exists with the label \"Import and add to project\". Check that this button is inactive until the required fields are filled out. \nCheck that clicking on the \"Import button\" takes you back to the main project page and that the imported layer, along with any dependencies, were added in the project's layers. ",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Importing_new_layers"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Layer_details_page:_UI_functionality_for_imported_layers",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Click on the \"View compatible layers\" link situated in the \"Project configuration\" portion of the page, under \"Layers\" table. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Select an imported layer (see in TC 1112 how to import a layer). \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Page heading \nCheck that the page heading includes the branch, tag or commit as entered when importing the layer.\nIf it's a commit, Check that only the first 10 characters are shown followed by an ellipsis character. The full commit shows on hover.The branch, tag or commit information also shows in the breadcrumb. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "The \"About\" information \nIt shows: \n- Summary \n- Description \nin this order. Those two items always show, independently of them being blank or not, since they can be edited by users. \n\nWhen an information item is empty, it shows as \"not set\" with a \"change\" icon. Click on the icon to add a value. \n\nFor \"Summary\" and \"Description\" clicking the \"change\" icon shows the selected information item in its editable state. It consists of a text area, set to 2 rows for the \"Summary\" and to 6 rows for the \"Description\", plus 'save' and 'cancel' buttons.  \nThe 'save' buttons only activate when there is at least one character in the text area. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "The tabs \nCheck that the tabs shown are: \n- \"Layer details\" \n- \"Recipes\" \n- \"Machines\" \nThe tabs should show in the order in which they are listed above. \n\n\"Layer details\" tab: \nIn not-editable pages, the tab shows: \n- A button to add / remove the layer to / from the project. In this tab, the button labels are: \n\t- \"Add the $layer_name layer to your project\" \n\t- \"Delete the $layer_name layer from your project\" \n\n- Some details about the layer: repository URL, repository subdirectory, revision (branch / tag / commit) and the list of layer dependencies. This is the information required from users when importing a layer.  The subdirectory and the layer dependencies can be blank.",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "If blank, they show as \"not set\". \n\nEditing the \"Repository URL\" \nThe \"Git repository URL\" cannot be blank. Therefore, we show only a \"change\" icon next to it. When you click the icon, the text input field is set to the current value. If you delete the value from the input field, we disable the \"save\" button. We enable it again when you type something in the field.  \n\nEditing the \"Repository subdirectory\" \nThe \"Repository subdirectory\" can be blank. Therefore, we show both \"change\" and \"delete\" icons. When you click the \"delete\" icon, we  \nshow the label \"Not set\".",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "\nWhen you click the \"change\" icon, the text input field is set \nto the current value.  \nIf you delete the value from the input field, we disable the \"save\" button. We enable it again when you type something in the field. \n \n\nEditing the \"Revision\" \nThe \"Revision\" cannot be blank. Therefore, we show only a \"change\" icon next to it. When you click the icon, the text input field is set to the current value. If you delete the value from the input field, we disable the \"save\" button. We enable it again when you type something in the field. \n\nThe \"Recipes\" tab \nIt shows: \n1: A counter in the tab label showing the total number of targets provided by the layer \n2: A button to add/remove the layer to/from the project. ",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "In this tab, the button labels are \n \n\"Add the $layer_name layer to your project to enable \nthese targets\" \n\"Delete the $layer_name layer from your project\" \n\n3: A \"Recipes\" table with the following columns: \n \n- Recipe \n- Description: the value of the DESCRIPTION variable. If not set, then the value of the SUMMARY variable. \n- Build recipe, which shows a \"build recipe\" button. The \"build recipe\" button is disabled when the layer is not added to the project. \nThe recipes table is sorted by \"Recipe\" in ascending alphabetical order. \n\nThe \"Machines\" tab: \nIt shows: \n1: A counter in the tab label showing the total number of machines provided by the layer \n2: A button to add/remove the layer to/from the project.",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "In this tab, the button labels are \n \n\t- \"Add the $layer_name layer to your project to enable these machines\" \n\t- \"Delete the $layer_name layer from your project\" \n3: A \"machines\" table with the following columns:  \n- Machine. \n \n- Description: The value of the DESCRIPTION variable in the .conf file \n- Select machine, which shows a \"select\" button. The \"select\" button is disabled when the layer is not added to the project. \nThe machines table is sorted by \"Machine\" in ascending alphabetical order. ",
+          "expected_results": "All mentioned elements should be present and functional."
+        }
+      },
+      "summary": "Layer_details_page:_UI_functionality_for_imported_layers"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Multiple_build_directories",
+      "author": [
+        {
+          "email": "stanciux.mihail@intel.com",
+          "name": "stanciux.mihail@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "after starting Toaster for the first time, go to http://[localhost]:8000/admin/ and login with the admin user you created during setup. Click on the Build environments section, and on the BuildEnvironment object. \n\n\n\nNote: you can create a superuser to enter as admin with ... poky/bitbake/lib/toaster/manage.py createsuperuser \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "make note of the \"sourcedir\" and \"builddir\" values. The build dir will be something like \"/home/user/path/build\" \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": " click \"back\", and click on the \"Add build environment\" button in the upper right corner. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "enter Address \"2\", Betype: \"local\", \"sourcedir\" is to be set to whatever the original build env is set, and \"builddir\" is ANOTHER path at the same level as the original builddir - e.g. \"/home/user/path/build2\" \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Click save \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Execute command : /poky$ source oe-init-build-env build2 \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Create new project \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "issue 2 build (e.g. core-image-minimal core-image-sato)\n\n\n\n\n\n",
+          "expected_results": "Both build commands should run simultaneously."
+        }
+      },
+      "summary": "Multiple_build_directories"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Run_again_button_from_all_builds_page_must_run_the_specified_task",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": " Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select a release and click on create project or select an existing project.",
+          "expected_results": " Project Created. \n"
+        },
+        "4": {
+          "action": "Build a image task (ex: core-image-minimal:clean) and wait until build finish.\nfrom all build page.",
+          "expected_results": " Build task finishes successfully. \n"
+        },
+        "5": {
+          "action": "Click on rebuild button from all build page.",
+          "expected_results": "Specified task will run again. \n"
+        },
+        "6": {
+          "action": "Click on the build and verify if the number of tasks executed = 1.",
+          "expected_results": "Only the specified task is executed. \n"
+        },
+        "7": {
+          "action": "From project builds page click on run again button.",
+          "expected_results": "Specified task will run again.\n"
+        },
+        "8": {
+          "action": "Click on the build and verify if the number of tasks executed = 1.",
+          "expected_results": ""
+        }
+      },
+      "summary": "Run_again_button_from_all_builds_page_must_run_the_specified_task"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Intel_layers_builds",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select a release and click on create project.",
+          "expected_results": "Project Created. \n"
+        },
+        "4": {
+          "action": "Click on layers tab.",
+          "expected_results": "Open compatible layers page. \n"
+        },
+        "5": {
+          "action": "Search for intel.",
+          "expected_results": "Return results \n"
+        },
+        "6": {
+          "action": "Add intel layers like: meta-intel, meta-intel-quark.",
+          "expected_results": "Layers added to project. \n"
+        },
+        "7": {
+          "action": "Click on the added layer.",
+          "expected_results": "Open layer page. \n"
+        },
+        "8": {
+          "action": "From machine tab, select a machine.",
+          "expected_results": "Machine has changed. \n"
+        },
+        "9": {
+          "action": "Build a recipe(core-image-minimal) or a recipe from recipe tab.",
+          "expected_results": "Build finishes successfully."
+        }
+      },
+      "summary": "Intel_layers_builds"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Download_other_artifacts",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Delete the build/tmp folder. (to make sure the rootfs task runs and other artifacts are generated for the build)",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n\t"
+        },
+        "3": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n\t"
+        },
+        "4": {
+          "action": "Enter a project name, select a release and click on create project.",
+          "expected_results": "Project Created. \n\t"
+        },
+        "5": {
+          "action": "Build an image recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": "Build finishes successfully. \n\t"
+        },
+        "6": {
+          "action": "Click on the built recipe.",
+          "expected_results": "Open build summary page. \n\t"
+        },
+        "7": {
+          "action": "From other artifacts tab click on a link.",
+          "expected_results": "You can download other artifacts."
+        }
+      },
+      "summary": "Download_other_artifacts"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Download_licence_manifest",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Delete the build/tmp folder. (to make sure license manifest is generated)",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start Toaster \n\n",
+          "expected_results": "Toaster starts. \n"
+        },
+        "3": {
+          "action": "Click on new project button. \n\n",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "4": {
+          "action": "Enter a project name, select a release and click on create project. \n\n",
+          "expected_results": "Project Created. \n"
+        },
+        "5": {
+          "action": "Build an image recipe (ex: core-image-minimal) and wait until build finish. \n\n",
+          "expected_results": "Build finishes successfully. \n"
+        },
+        "6": {
+          "action": "Click on the built recipe. \n\n",
+          "expected_results": "Open build summary page. \n"
+        },
+        "7": {
+          "action": "From Image tab click on \"Download\" button for License manifest.",
+          "expected_results": "You can download license manifest."
+        }
+      },
+      "summary": "Download_licence_manifest"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_dependencies_layers",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select a release and click on create project.",
+          "expected_results": "Project Created. \n"
+        },
+        "4": {
+          "action": "Click on Layers.",
+          "expected_results": "Open compatible layers page. \n"
+        },
+        "5": {
+          "action": "Add a layer with multi-level dependencies. (ex: meta-acer) \nThis layer depends on meta-networking, which in turn depends on meta-android. \n \n",
+          "expected_results": "The selected layer and dependencies were added to project. \n"
+        },
+        "6": {
+          "action": "Check if meta-python appears in the dependencies list, and add the layers to project.",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Delete a dependency layer.",
+          "expected_results": "Layer removed from project. \n \n"
+        },
+        "8": {
+          "action": "Build a recipe (ex: core-image-minimal) and wait until build finish.\n",
+          "expected_results": "Build will fail with an error.\n\n\t"
+        }
+      },
+      "summary": "Test_dependencies_layers"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_build_recipe_button_from_recipes_page",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select a release and click on create project.",
+          "expected_results": "Project Created. \n"
+        },
+        "4": {
+          "action": "Click on software recipes / image recipes.",
+          "expected_results": "Open compatible software recipes page. \n"
+        },
+        "5": {
+          "action": "Select a recipe and click on 'add layer' button.",
+          "expected_results": "Layer added to project and the 'add layer' button becomes 'build recipe'. \n"
+        },
+        "6": {
+          "action": "Click on \"Build recipe\" button for one recipe (ex : core-image-minimal / busybox).",
+          "expected_results": "Build finishes successfully."
+        },
+        "7": {
+          "action": "Test this for software and image recipes tables.",
+          "expected_results": ""
+        }
+      },
+      "summary": "Test_build_recipe_button_from_recipes_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_compatible_machines",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select a master release and click on create project.",
+          "expected_results": "Project Created. \n"
+        },
+        "4": {
+          "action": "Go to machines page.",
+          "expected_results": "Open compatible machines page. \n"
+        },
+        "5": {
+          "action": "Choose a machine and click on add layer for it. (intel-core2-32)",
+          "expected_results": "Layers added to project and add layer button becomes select machine. \n"
+        },
+        "6": {
+          "action": "Click on select machine.",
+          "expected_results": "Machine has changed. \n"
+        },
+        "7": {
+          "action": "Go to layer page that generate the machine. (meta-intel)",
+          "expected_results": "Open layer page \n"
+        },
+        "8": {
+          "action": "Build a recipe generated by that layer.",
+          "expected_results": "Build finishes successfully."
+        }
+      },
+      "summary": "Test_compatible_machines"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Builds_with_different_machines",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select a master release and click on create project.",
+          "expected_results": "Project Created. \n"
+        },
+        "4": {
+          "action": "Select a machine (ex: qemux86-64)",
+          "expected_results": "The machine has changed. \n"
+        },
+        "5": {
+          "action": "Build a recipe (ex: core-image-minimal) and wait until buid finish.",
+          "expected_results": "Build finishes successfully. \n"
+        },
+        "6": {
+          "action": "Go to project page and change the machine (ex: qemumips)",
+          "expected_results": "The machine has changed. \n"
+        },
+        "7": {
+          "action": "Build a recipe (ex: core-image-sato) and wait until build finish.",
+          "expected_results": "Build finishes successfully. \n\nYou can build recipes with different machines."
+        },
+        "8": {
+          "action": "Check on build summary page that the machine match the machine selected.",
+          "expected_results": ""
+        }
+      },
+      "summary": "Builds_with_different_machines"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_bitbake_variables_-_IMAGE_FSTYPES",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": "Click on new project button.",
+          "expected_results": "Open create a new project page. \n"
+        },
+        "3": {
+          "action": "Enter a project name, select release and click on create project.",
+          "expected_results": "Project Created. \n"
+        },
+        "4": {
+          "action": "Go to Configuration --> BitBake variables",
+          "expected_results": "Open Bitbake variables page. \n"
+        },
+        "5": {
+          "action": "Change IMAGE_FSTYPES variable, add some image types like: hddimg, ext4, etc.",
+          "expected_results": "Image types were added. \n"
+        },
+        "6": {
+          "action": "Build a recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": "Build finishes successfully. \n"
+        },
+        "7": {
+          "action": "Verify in the build summary page if the image types selected were built.",
+          "expected_results": "All the image types selected appears in the build summary page."
+        }
+      },
+      "summary": "Test_bitbake_variables_-_IMAGE_FSTYPES"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Software_recipes:_default_view",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": " If no images exist in the project, build an image by inserting \"core-image-minimal\" in the \"Recipes\" field and press the \"Build\" button. Wait for the image to finish building. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "On the project page click on the \"Software Recipes\" link situated in the left-handed side of the page, under the \"Project configuration\" menus, in the \"COMPATIBLE METADATA\" table. \n\n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Check that \"Compatible software recipes\" table is populated. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that the following columns are shown by default: \n\n\t\tSoftware recipe \n\t\tDescription \n \n\t\tLayer \n\t\tBuild \n\t\t     Version ",
+          "expected_results": ""
+        }
+      },
+      "summary": "Software_recipes:_default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Software_recipes:_sorting_the_content_of_the_software_recipes_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Navigate to the \"Software Recipes\" page. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Make sure the table is sorted on the \"Software Recipe\" column by default in ascending order. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Activate all columns from the \"Edit column\" drop-down menu. Check that \"Build\" and \"Software Recipe\" columns cannot be unchecked. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that \"Software Recipe\", \"Section\", \"License\", \"Layer\" are the only sortable table heads. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Sort the table by \"Layer\" and then navigate away by selecting a layer(such as meta-yocto). When you click \"back\" button in web-browser to go back to the \"Compatible image recipes\" table it should still be sorted by \"Layer\". \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Sorting and \"Edit columns\" \nIf you use the \"Edit columns\" menu to hide the column with the applied sorting, we revert the sorting to the default sorting (i.e. \"Recipe\"). The default sorting always uses one of the core columns, which cannot be hidden using the \"Edit columns\" menu. \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Sorting and search \nSearching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted. \nSort recipes by \"Layer\" column heading. Input a string (such as \"meta\") in search box and click search button. Make sure results returned are sorted by \"Layer\".",
+          "expected_results": ""
+        }
+      },
+      "summary": "Software_recipes:_sorting_the_content_of_the_software_recipes_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Software_recipes:_Searching_the_content_of_the_software_recipes_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Navigate to the \"Software Recipes\" page. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the search is made of a text input field and a \"Search\" button in a toolbar above the table. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "When no search query has been entered, we have placeholder text saying: \"Search compatible software recipes\". \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Input \"core\" in the text input field. The placeholder text disappears when the first character is typed. Click search button. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": " \n(1) returned results \nThe search string is kept in the text input field. The results returned occur. Click  \"Clear search\" icon to clear the search and display the compatible recipes. \n(2) no results returned \nIf your search query returns no results, the page heading changes to \"No recipes found\", and we show you an alert with a search form and an option to show all targets. Check that \"show compatible recipes\" button is available. \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "When I run a search, the search happens against the following columns (independently of they being shown or hidden):\n- Software Recipe\n- Recipe version\n- Description\n- Recipe file\n- Section\n- License\n- Layer\n- Revision\nInput a string to search for the above column headings separately to make sure that the search happens against the columns. \n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Search, sorting and \"Edit columns\" \nSearching does not change the state of the table: the same columns remain hidden and the same sorting applied when search results are displayed, but filters are cleared by the search results.\nSearch a string and make sure that the same columns remain hidden and the same sorting applied. \n\n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Search and filters \nThe scope of the filters is the content currently on the table (this means all table pages, not only the one displayed). The scope of the search is always the content of the database. \n\nIf I run a search query, any filter applied afterwards will filter the content returned by the search query. \n\nIf I run a search query while a filter is applied, the filter is cleared by the results of the search query (i.e. we display the results of the search query and clear the filter applied beforehand). The same happens if I click the \"Clear search\" icon when a filter is applied to a set of search results (both search results and applied filter are cleared, and the table shows all the targets). ",
+          "expected_results": ""
+        }
+      },
+      "summary": "Software_recipes:_Searching_the_content_of_the_software_recipes_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Software_recipes:_Filter_the_contents_of_the_software_recipes_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All builds\" table.",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Navigate to the \"Software Recipes\" page.",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Make sure the following table column has filters: \n- Build",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Filters are mutually exclusive. Click a filter button of a one column and a filter dialogue occurs. Select a filter item. The filter result would be showed. Then select another filter item of another column and the previously applied filter is overridden by the newly selected filter when a filter from a different column is applied to the table. In this state, we show some help text next to the \"Apply\" button, saying \"You can only apply one filter to the table. This filter will override the current filter.\"",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Filters are overridden by search. Run a search query and you can see previous filter results are overridden by the results of the search query.",
+          "expected_results": ""
+        }
+      },
+      "summary": "Software_recipes:_Filter_the_contents_of_the_software_recipes_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_the_packages_included_in_the_image",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": " Click on new project button.",
+          "expected_results": " Open create a new project page. \n"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project.",
+          "expected_results": " Project Created. \n"
+        },
+        "4": {
+          "action": " Build a recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": " Build finishes successfully. \n"
+        },
+        "5": {
+          "action": " Click on the built recipe.",
+          "expected_results": " Open build summary page. \n"
+        },
+        "6": {
+          "action": " Under IMAGES tab click on the recipe built.",
+          "expected_results": "Image page open. \n"
+        },
+        "7": {
+          "action": "Click on a package name.",
+          "expected_results": "Open the package page. \n"
+        },
+        "8": {
+          "action": "Under file title click on the link to file.",
+          "expected_results": "You are redirected to directory structure and you can see where the file is located."
+        }
+      },
+      "summary": "Test_the_packages_included_in_the_image"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_the_filters_from_a_image_page",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": " Click on new project button.",
+          "expected_results": " Open create a new project page. \n"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project.",
+          "expected_results": " Project Created. \n"
+        },
+        "4": {
+          "action": " Build a recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": " Build finishes successfully. \n"
+        },
+        "5": {
+          "action": " Click on the built recipe.",
+          "expected_results": " Open build summary page. \n"
+        },
+        "6": {
+          "action": "Click on Configuration - Bitbake Variables.",
+          "expected_results": "Open bitbake variables page. \n"
+        },
+        "7": {
+          "action": "Test Description filter. ",
+          "expected_results": "Filter works ok. (filter returns only items that match the selected criteria) "
+        }
+      },
+      "summary": "Test_the_filters_from_a_image_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_dependencies_link",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Start Toaster.",
+          "expected_results": "Toaster starts. \n"
+        },
+        "2": {
+          "action": " Click on new project button.",
+          "expected_results": " Open create a new project page. \n"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project.",
+          "expected_results": " Project Created. \n"
+        },
+        "4": {
+          "action": " Build a recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": " Build finishes successfully. \n"
+        },
+        "5": {
+          "action": " Click on the built recipe.",
+          "expected_results": " Open build summary page. \n"
+        },
+        "6": {
+          "action": "Click on recipes tab.",
+          "expected_results": "Open recipes page. \n"
+        },
+        "7": {
+          "action": "Click on edit columns and select Dependencies.",
+          "expected_results": "Dependencies column is shown in the table. \n"
+        },
+        "8": {
+          "action": "Click on a number of dependencies.",
+          "expected_results": "A pop up with dependencies will appear. \n"
+        },
+        "9": {
+          "action": "Click on a dependency. ",
+          "expected_results": "Open recipe dependency page. "
+        }
+      },
+      "summary": "Test_dependencies_link"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_recipe_file_link",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster. \n\n\t",
+          "expected_results": "Toaster starts. \n\n\t"
+        },
+        "2": {
+          "action": " Click on new project button. \n\n\t",
+          "expected_results": " Open create a new project page. \n\n\t"
+        },
+        "3": {
+          "action": " Enter a project name, select a release (ex: master) and click on create project. \n\n\t",
+          "expected_results": " Project Created. \n\n\t"
+        },
+        "4": {
+          "action": "Click on Image recipes tab. \n\n\t",
+          "expected_results": "Open Compatible image recipes table. \n\n\t"
+        },
+        "5": {
+          "action": "Click on edit columns and select recipe file. \n\n\t",
+          "expected_results": "Recipe file column appears in the table. \n\n\t"
+        },
+        "6": {
+          "action": "Click on the blue button near a recipe file. \n\n\t",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Repet steps - 4 to 6 for software recipes.",
+          "expected_results": ""
+        }
+      },
+      "summary": "Test_recipe_file_link"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.See_packages_size",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster. \n\n\t",
+          "expected_results": " Toaster starts. \n\n\t"
+        },
+        "2": {
+          "action": " Click on new project button. \n\n\t",
+          "expected_results": " Open create a new project page. \n\n\t"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project. \n\n\t",
+          "expected_results": " Project Created. \n\n\t"
+        },
+        "4": {
+          "action": " Build a recipe (ex: core-image-minimal) and wait until build finish. \n\n\t",
+          "expected_results": " Build finishes successfully. \n\n\t"
+        },
+        "5": {
+          "action": " Click on the built recipe. \n\n\t",
+          "expected_results": " Open build summary page. \n\n\t"
+        },
+        "6": {
+          "action": "Click on packages tab. \n\n\t",
+          "expected_results": "Open packages page. \n\n\t"
+        },
+        "7": {
+          "action": "Click on size to sort the table. ",
+          "expected_results": "You can check the size of each package. \n\nWhen you click on 'Size' the first time, the correct sorting is the inverse one (biggest package on top). Clicking a second time will invert the sorting (you'll see packages with 0 B size on top)."
+        }
+      },
+      "summary": "See_packages_size"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Build_multiple_recipes",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Start Toaster. \n\n\t",
+          "expected_results": " Toaster starts. \n\n\t"
+        },
+        "2": {
+          "action": " Click on new project button. \n\n\t",
+          "expected_results": " Open create a new project page. \n\n\t"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project. \n\n\t",
+          "expected_results": " Project Created. \n\n\t"
+        },
+        "4": {
+          "action": " Build a multiple recipes (ex: \"core-image-minimal core-image-sato\") and wait until build finish. ",
+          "expected_results": "Builds finishes successfully. \n\nYou can build multiple recipes with toaster"
+        }
+      },
+      "summary": "Build_multiple_recipes"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Build_a_recipe_with_different_distro",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Start Toaster. \n\n\t",
+          "expected_results": " Toaster starts. \n\n\t"
+        },
+        "2": {
+          "action": " Click on new project button. \n\n\t",
+          "expected_results": " Open create a new project page. \n\n\t"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project. \n\n\t",
+          "expected_results": " Project Created. \n\n\t"
+        },
+        "4": {
+          "action": "From project page click on Bitbake variables tab. \n\n\t",
+          "expected_results": "Open Bitbake variables page. \n\n\t"
+        },
+        "5": {
+          "action": "Click on change button for distro. \n\n\t",
+          "expected_results": "A type in form appears. \n\n\t"
+        },
+        "6": {
+          "action": "Change distro (ex: poky-lsb). \n\n\t",
+          "expected_results": "Distro has changed. \n\n\t"
+        },
+        "7": {
+          "action": "Add specific layers for distro (meta-qt3, meta-qt4) \n\t\n\t",
+          "expected_results": "Layers added to the project \n\n\t"
+        },
+        "8": {
+          "action": " Build a recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": "Build finishes successfully. \n\nThe 'success' criteria for this one should be that the build is reported as using the poky-lsb distro in the build summary page, and that the DISTRO variable value in the bitbake variables table is set to the value specified in toaster (poky-lsb again)."
+        }
+      },
+      "summary": "Build_a_recipe_with_different_distro"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_package_format_-_ipk_rpm_deb",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Start Toaster. \n\n\t",
+          "expected_results": " Toaster starts. \n\n\t"
+        },
+        "2": {
+          "action": " Click on new project button. \n\n\t",
+          "expected_results": " Open create a new project page. \n\n\t"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project. \n\n\t",
+          "expected_results": " Project Created. \n\n\t"
+        },
+        "4": {
+          "action": "From the project page click on bitbake variables tab. \n\n\t",
+          "expected_results": "Open bitbake variables page. \n\n\t"
+        },
+        "5": {
+          "action": "Click on change button near PACKAGE_CLASSES and select all the package formats (rpm, deb, ipk). \n\n\t",
+          "expected_results": "Package classes selected. \n\n\t"
+        },
+        "6": {
+          "action": "Build a recipe (ex: core-image-minimal) and wait until build finish.",
+          "expected_results": "Build finishes successfully.\nYou can see the package classes in the build summary page."
+        }
+      },
+      "summary": "Test_package_format_-_ipk_rpm_deb"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Test_IMAGE_INSTALL_append_variable",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster. \n\n",
+          "expected_results": " Toaster starts. \n\n\t"
+        },
+        "2": {
+          "action": " Click on new project button. \n\n",
+          "expected_results": " Open create a new project page. \n\n\t"
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project. \n\n",
+          "expected_results": " Project Created. \n\n\t"
+        },
+        "4": {
+          "action": "From the project page click on bitbake variables tab. \n\n",
+          "expected_results": "Open bitbake variables page. \n\n\t"
+        },
+        "5": {
+          "action": "Click on change button for IMAGE_INSTALL_append and add a variable (ex: acpid). \n\n",
+          "expected_results": "Variable added. \n\n\t"
+        },
+        "6": {
+          "action": "Build a recipe (ex: core-image-minimal) and wait until build finish. \n\n",
+          "expected_results": "Build finishes successfully. \n\n\t"
+        },
+        "7": {
+          "action": "After build finishes go to build page. \n\n",
+          "expected_results": "Open build summary page. \n\n\t"
+        },
+        "8": {
+          "action": "Go to package tab and search for acpid.",
+          "expected_results": "You should get results for ssh packages."
+        }
+      },
+      "summary": "Test_IMAGE_INSTALL_append_variable"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.New_custom_image:_default_view",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table.  \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the table is populated with the list of image recipes (eg. core-image minimal, core-image-lsb) \n\n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": " Check that by default the following columns are shown: Image recipe, Version, Description, Layer, Customise  \n\n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "From the \"Edit columns\" menu, activate the: Recipe file, Section, License, Git revision \n\n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Check that the \"Git revision\" entries match the release entry from the main project page, in the project details section. \n\n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Check that the image recipes provided by layers added to the project show a 'customise' button, while image recipes provided by layers not added to the project show an 'add layer' button ",
+          "expected_results": ""
+        }
+      },
+      "summary": "New_custom_image:_default_view"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.New_custom_image:_sorting_the_content_of_new_custom_image_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Make sure that the table is sorted on the ‘Image recipe’ column by default in ascending order.  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Clicking on Image recipe should revert the sorting. (from 'a to z' changes to 'z to a')  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "From the \"Edit columns\" menu activate all the columns. Check that ‘Image recipe’ and ‘Customise’ columns cannot be unchecked. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Check that Image recipe, Section, Layer and License are the only sortable table heads.  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Sort the table by \"Layer\" and then navigate away by selecting an image (such as core-image-lsb). When you click the \"back\" button in the web-browser to go back, the \"New custom image\" table should still be sorted by \"Layer\".  \nThis should apply also by navigating back to the page by any other means. \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Sorting and \"Edit columns\" menu: If you use the \"Edit columns\" menu to hide the column with the applied sorting, we revert the sorting to the default sorting (i.e. \"Image recipe\"). The default sorting always uses one of the core columns, which cannot be hidden using the \"Edit columns\" menu  \n\n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Sorting and search: Searching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted. Sort recipes by \"Layer\" column heading. Input a string (such as \"core-image\") in search box and click search button. Make sure results returned are sorted by \"Layer\".",
+          "expected_results": "N/A"
+        }
+      },
+      "summary": "New_custom_image:_sorting_the_content_of_new_custom_image_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.New_custom_image:_searching_the_content_of_new_custom_image_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer  \n \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that the search is made of a text input field and a \"Search\" button in a toolbar above the table. When no search query has been entered, the text input field should show the following placeholder text: \"Search select the image recipe you want to customise\" \n  \n\n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Input \"core\" in the text input field. The placeholder text disappears when the first character is typed. Click search button. \n \n\n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "The search string is kept in the text input field. The results returned occur. Click \"Clear search\" icon to clear the search and display the image recipes.  If your search query returns no results, we show you an alert with a search form and an option to show all image recipes. Check that \"show all\" link is available.  \n\n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Search, sorting and \"Edit columns\": Searching does not change the state of the table: the same columns remain hidden and the same sorting applied when search results are displayed, but filters are cleared by the search results. Search a string and make sure that the same columns remain hidden and the same sorting applied.  \n\n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Search and filters \n \n\t•\tThe scope of the filters is the content currently on the table (this means all table pages, not only the one displayed). The scope of the search is always the content of the database.  \n\n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "If I run a search query, any filter applied afterwards will filter the content returned by the search query. \tIf I run a search query while a filter is applied, the filter is cleared by the results of the search query (i.e. we display the results of the search query and clear the filter applied beforehand). The same happens if I click the \"Clear search\" icon when a filter is applied to a set of search results (both search results and applied filter are cleared, and the table shows all the targets). ",
+          "expected_results": "\n  \n"
+        }
+      },
+      "summary": "New_custom_image:_searching_the_content_of_new_custom_image_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.New_custom_image:_Filter_the_contents_of_the_new_custom_image_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer  \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Make sure the following table column has filters: Customise  \n\n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Click the filter button in the \"Customise\" column and a filter dialogue comes up. Select a filter option. The filter results should be showed. \n\n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Filters are overridden by search. Run a search query and you can see previous filter results are overridden by the results of the search query.",
+          "expected_results": "N/A"
+        }
+      },
+      "summary": "New_custom_image:_Filter_the_contents_of_the_new_custom_image_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Create_new_custom_image",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Search for rpi-basic-image, click on 'add layer' button. Make sure a \"layer added\" notification shows and a \"customise\" button is displayed. Click the \"customise\" button, type a name for you new custom image and click on create custom image. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Verify that image was created: when you create the custom image you will be redirected to the custom image details page, and a notification at the top of the page should tell you: ‘Your custom image X has been created. You can now add or remove packages as needed. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "If you select an image that has not been built beforehand you should not see the 'add / remove' packages table until you build the image. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "If you select an image that has been built beforehand you should see the 'add / remove' packages table when you create the custom image. ",
+          "expected_results": "N/A"
+        }
+      },
+      "summary": "Create_new_custom_image"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Custom_image_page_details",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "After you create a new custom image  go to the custom image page, by clicking on the custom image.   \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Breadcrumbs  \n \n\t * Observe that the 3 breadcrumbs at the top left are:  \n \n\t\ta live link that will take you back to the project page \n\t\tCustom images: a live link that will take you back to the custom images table \n\t\timage name(toaster-custom-images): the name of the current custom image (not a link)  \n \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe the 2 buttons build Custom image and Download recipe file  \n \n\ti.\tTest this 2 buttons \n\tii.\tYou should always be able to build the custom image, but you only should be able to download the recipe file when the package content of the custom image is known. When you cannot download the recipe file, the 'download' button at the top of the page is disabled, and the right hand column does not show information about the recipe file.  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Observe that there is a right-hand box, with information about the images  \n \n\ti.\tThere is a number of packages included in the custom image \n\tii.\tApprox package size \n \n\tiii.\tLayer \n \n\tiv.\tImage based on \n \n\tv.\tRecipe file (only when you can download it_ \n\tvi.\tVersion \n \n\tvii.\tLicense  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe that the page includes a table with packages and you can add or remove packages from the custom image. The packages table only appears when: \n\na) the image recipe you chose as your base image when creating the custom image has been built within the project \n\nb) the custom image itself has been built \n\nIf no packages table shows, you see a notification with a build button instead. ",
+          "expected_results": "N/A"
+        }
+      },
+      "summary": "Custom_image_page_details"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Custom_image_page_–_Add_|_Remove_packages_table",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "After you create a new custom image  go to the custom image page, by clicking on the custom image.  \n\n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Make sure that the table is sorted on the ‘Package’ column by default in ascending order.   \n\n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Check that by default the following columns are shown: Package, Package Version, Approx Size  \n\n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "From the \"Edit columns\" menu, activate the: License, Recipe, Recipe version and Reverse dependencies columns  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Check that ‘Package’, Approx Size, License, Recipe are the only sortable table heads.   \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Sorting and \"Edit columns\": If you use the \"Edit columns\" menu to hide the column with the applied sorting, we revert the sorting to the default sorting (i.e. \"Package\"). The default sorting always uses one of the core columns, which cannot be hidden using the \"Edit columns\" menu   \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Sorting and search: Searching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted. Sort recipes by \"Recipe\" column heading. Input a string (such as \"acl\") in search box and click search button. Make sure results returned are still sorted by \"Recipe\".   \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Click \"Clear search\" icon to clear the search and display the Packages.   \n\n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Make sure the following table column has filters: Add | Remove (Click on 'Edit custom image' in the left pane of the custom image)  \n\n1",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "Click the filter button: a filter dialogue displays. Select a filter option. The filter results should be showed.  \n\n1",
+          "expected_results": ""
+        },
+        "11": {
+          "action": "Filters are overridden by search. Run a search query and you can see previous filter results are overridden by the results of the search query.  \n\n1",
+          "expected_results": ""
+        },
+        "12": {
+          "action": "This page needs a special no results message for the search. You can see in the doc attached to\nhttps://bugzilla.yoctoproject.org/show_bug.cgi?id=9154   \n\nTo test it, enter a random string in the search input field (something like \"bbb\") and click the 'search' button. The special no results message includes the following:  \n\na) instructions about searching and building recipes in order to generate new packages  \n\nb) a search text input field with the search string you typed, a 'clear' icon and a search button. Click the 'clear' icon: the search field should be cleared and the full list of packages should be shown.  \n\nc) a 'show all packages' link. Click the link: the search field should be cleared and the full list of packages should be shown.  ",
+          "expected_results": "N/A"
+        }
+      },
+      "summary": "Custom_image_page_–_Add_|_Remove_packages_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Adding_packages_without_dependencies_from_custom_images",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n\n    ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer  \n\n\n    ",
+          "expected_results": " "
+        },
+        "3": {
+          "action": "Choose an image recipe example:(core-image-sato) and click on the customise button on the far right (note if that layer is not added the button will say +Add layer, add it and then customise) \n\n\n    ",
+          "expected_results": " A pop out should appear and you should get to give the new image a customized name. Then you will be redirected to a page of Add|Remove Packages. If this image has not been build it will not have packages.\n\n"
+        },
+        "4": {
+          "action": "Build the new image if it has not been build, else start adding packages without dependencies example: attr-doc \n\n    \n    ",
+          "expected_results": "You should get a message in blue that says \"You have added 1 package to $image-custom-name: $package-name\" "
+        },
+        "5": {
+          "action": "Build the image again.\n",
+          "expected_results": "Expected Result on step 5: the packages you have added should be installed in the image."
+        }
+      },
+      "summary": "Adding_packages_without_dependencies_from_custom_images"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Removing_packages_without_and_with_dependencies__from_custom_images",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n\n    ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer  \n\n\n\n    ",
+          "expected_results": " A pop out should appear and you should get to give the new image a customized name. Then you will be redirected to a page of Add|Remove Packages. If this image has not been build it will not have packages. \n\n"
+        },
+        "3": {
+          "action": "Choose an image recipe example:(core-image-sato) and click on the customise button on the far right (note if that layer is not added the button will say +Add layer, add it and then customise) \n\n\n\n    ",
+          "expected_results": "A pop out should appear and you should get to give the new image a customized name. Then you will be redirected to a page of Add|Remove Packages. If this image has not been build it will not have packages.\n\n"
+        },
+        "4": {
+          "action": "Build the new image if it has not been build else start removing a packages (click on 'Edit custom image' in the left pane of the custom image) that have dependencies and packages that have no dependencies that are already included by clicking on the red button \"Remove Package\" \n\n\n    \n    ",
+          "expected_results": "You should get a message in blue that says \"You have removed 1 package to $image-custom-name: $package-name\" "
+        },
+        "5": {
+          "action": "Build the image again.",
+          "expected_results": "the packages you have removed should not be installed in the image."
+        }
+      },
+      "summary": "Removing_packages_without_and_with_dependencies__from_custom_images"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Adding_packages_with_dependencies",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Access a project page, either by creating a new project or accessing an existing project from the \"All projects\" table. \n\n    ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "On the project page click on the \"New custom image\" link situated on the left-hand side, near Configuration, builds, import layer  \n\n\n    ",
+          "expected_results": " "
+        },
+        "3": {
+          "action": "Choose an image recipe example:(core-image-sato) and click on the customise button on the far right (note if that layer is not added the button will say +Add layer, add it and then customise) \n\n\n    ",
+          "expected_results": "A pop out should appear and you should get to give the new image a customized name. Then you will be redirected to a page of Add|Remove Packages. If this image has not been build it will not have packages."
+        },
+        "4": {
+          "action": "Build the new image if it has not been build else start adding packages that have dependencies ( you will be able to see in the dependencies column a little square with a number, that tells you the dependencies it holds) example: libattr this holds 2 dependencies( bash and glibc) ",
+          "expected_results": " You should get a pop-out that that say \"$package_name dependencies\" then it should list the dependencies. Once clicked on the add packages button it should add the packages listed in the pop-out."
+        },
+        "5": {
+          "action": "Build the image again.",
+          "expected_results": ""
+        }
+      },
+      "summary": "Adding_packages_with_dependencies"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Create_Project",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project by issuing a name and selecting a release version.",
+          "expected_results": "Once project is created it should redirect you to a new project configuration page"
+        },
+        "3": {
+          "action": "Check that the h1 page title is set to the name the user typed in the new project form. ",
+          "expected_results": ""
+        }
+      },
+      "summary": "Create_Project"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_project_detail_page_left_bar_menu",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n    \n",
+          "expected_results": "Once project is created it should redirect you to a new project configuration page. \n\n"
+        },
+        "3": {
+          "action": "Check the page contains the tabs \n    Configuration ---> selected by default \n    Compatible Metadata (separation label) \n    Custom images \n    Image recipes \n    Software recipes \n    Machines \n    Layers \n    Extra Configuration (separation label) \n    BitBake variables \n\n",
+          "expected_results": " All elements are present. \n\n"
+        },
+        "4": {
+          "action": "Click on each element to see if the h2 title is changing to the respective link clicked. Example if clicked on \"Custom Images\" then the h2 title should change to \"Custom images\"",
+          "expected_results": "All elements are clickable and h2 title changes to the corresponding title.."
+        }
+      },
+      "summary": "Verify_project_detail_page_left_bar_menu"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Configuration_information_of_Project_Detail_page",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Clone Poky and start toaster \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a master toaster project \n    \n",
+          "expected_results": "Once project is created it should redirect you to a new project configuration page \n\n"
+        },
+        "3": {
+          "action": "Check that the configuration button on the left side bar is selected by default \n\n",
+          "expected_results": " Expected result step 3 & 4: The configuration link next to the build link should be selected see attachment.  \n\n\n\n"
+        },
+        "4": {
+          "action": "The configuration details should include canvas: \n    Machine \n    Most built recipes \n    Layers \n    Project Release ",
+          "expected_results": "Expected result step 4: A machine must always be set. \n\nThe default layers specified in the Toaster configuration must always be listed in the layer section (in our case, for the poky configuration we should have openembedded-core, meta-poky and meta-yocto-bsp)"
+        }
+      },
+      "summary": "Configuration_information_of_Project_Detail_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_Machine_information_of_project_detail_page",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n    \n",
+          "expected_results": "Expected result step 2: Once project is created it should redirect you to a new project Configuration page \n\n"
+        },
+        "3": {
+          "action": "The configuration details should include a label in bold font that says: \n    Machine: this canvas should have the machine label type under it and an editing button on the side ",
+          "expected_results": "Expected result step 3: Compare to the attached snapshot. The machine must always be set."
+        }
+      },
+      "summary": "Verify_Machine_information_of_project_detail_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_most_built_recipes_information_of_the_project_detail_page",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n    \n",
+          "expected_results": "Expected result step 2: Once project is created it should redirect you to a new project configuration page "
+        },
+        "3": {
+          "action": "The configuration details should include a label in bold font that says: \n    Most built recipes: In this canvas one of the following information should show:  \n\n            a) If there has been no built recipes it should have a label that says: \n                             \"You haven't built any recipes yet, choose a recipe to build\"  \n\n            b) Else it should have a list of built recipes and a check box in front of it. So that it could be selected and built again ",
+          "expected_results": "Expected result step a: See ProjectDetailPage2.png attachment.\n\nExpected result step b: See ProjectDetailPage.png attachment."
+        }
+      },
+      "summary": "Verify_most_built_recipes_information_of_the_project_detail_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_project_release_information_on_project_detail_page",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n    \n",
+          "expected_results": "Expected result step 2: Once project is created it should redirect you to a new project configuration page. "
+        },
+        "3": {
+          "action": "The configuration details should include a label in bold font that says: \n         Project release: this canvas should also have a label that show the release project you chose at the beginning.",
+          "expected_results": "Expected result step 3: See attachment ProjectDetailPage.jnp."
+        }
+      },
+      "summary": "Verify_project_release_information_on_project_detail_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_layer_information_of_the_project_detail_page",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/git/poky",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start toaster",
+          "expected_results": "Expected result step 2: Once project is created it should redirect you to a new project configuration page. \n\n"
+        },
+        "3": {
+          "action": "Create a toaster project \n    \n",
+          "expected_results": "Expected result step 3: See attachment of layerCanvas.png\n"
+        },
+        "4": {
+          "action": "The configuration details should include a label with bold font that says: \n       Layer:  this canvas should have 3 layers listed by default (openembedded-core, meta-poky, and meta-yocto-bsp).  \n       Each layer should have a trashcan icon at the side that can be used to erase the label from the project. \n        The layer canvas should have a text box with the text \"type a layer name\" a button \"Add layer\" next to it. \n        just underneath a \"view compatible layer | import layer\" link. ",
+          "expected_results": ""
+        }
+      },
+      "summary": "Verify_layer_information_of_the_project_detail_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_project_detail_links",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n\n",
+          "expected_results": "Expected result step 2: Once project is created it should redirect you to a new project configuration page.  \n\n"
+        },
+        "3": {
+          "action": "The configuration details should include \n    4 links, starting in the upper left side the Configuration link, Builds(#) link, Import layer link, and the New custom image link. \n\n    ",
+          "expected_results": "Expected result step 3: All links should be clickable and should have information or tables, or forms. see attachment projectDetailLinks.png"
+        }
+      },
+      "summary": "Verify_project_detail_links"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_build_texbox_exists_and_works",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n    \n",
+          "expected_results": " Once project is created it should redirect you to a new project configuration page.  \n\n\n"
+        },
+        "3": {
+          "action": "The configuration details should include \n    After the 4 links (Configuration, Build(#), Import layer & New custom image)  at the far right there should be a textbox with the label that says....\"Type the recipe you want to build\"  and a button \"Build\" \n\n",
+          "expected_results": "See attachment buildTXT.png, The build button should be disabled whenever the text input field is empty, so that you cannot start a build with a blank target  \n\n"
+        },
+        "4": {
+          "action": "Type in the textbox an image you would like to build example (core-image-minimal) and click the build button.\n\n",
+          "expected_results": " Image starts building. Whenever there is information in the image recipes and software recipes tables, the text input field should present suggestions from the list of recipes provided by the layers in the \"layers\" list. The suggestions contain the string typed in the input field, and update as you type. They appear on typing the second character. A maximum of 8 suggestions can be shown. They are sorted as follows: first recipes starting with the string, in alphabetical order; then recipes containing the string, also in alphabetical order  \n\n\nWhen you click the build button you are brought to the \"Builds\" tab, and a new build in progress appears at the top of the \"Latest project builds\" section"
+        }
+      },
+      "summary": "Verify_build_texbox_exists_and_works."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Veryfing_the_builds_link_show_proper_information",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n \n",
+          "expected_results": " Once project is created it should redirect you to a new project configuration page. \n\n\n"
+        },
+        "3": {
+          "action": "The configuration details should include \n    A builds tab that when clicking on, it should display one of the following: \n       \n\n        a) A label that says \"Latest project builds\"  then a label with \"All project builds\" \n                   If you have a finished build or there is an ongoing builds then: \n                           You should see a progress bar of the ongoing builds in the project. \n                            You should see a table with the already done builds in the project. \n\n\n        b) \"All project builds\" and a search textbox with a button nothing else only if there are no builds done in the project \n        ",
+          "expected_results": "Expected result for step a):  See ExistingBuilds.png attachment. \n\n\nExpected result for step b): See ZeroBuilds.png attachment. "
+        }
+      },
+      "summary": "Veryfing_the_builds_link_show_proper_information"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_that_the_Import_layer_link_shows_the_form",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n\n",
+          "expected_results": "  Once project is created it should redirect you to a new project configuration page. \n\n\n"
+        },
+        "3": {
+          "action": "The configuration details should include \n    An Import layer link  that when clicking on, it should display: \n          A label that says \"Layer repository information\" \n          A label that says \"The layer you are importing must be compatible with Yocto Project master, which is the release you are using in this project.\" \n        Form composed of the following elements: \n            Layer name : textbox \n            Git repository URL : textbox \n            Repository subdirectory (optional) : textbox \n            Git revision : textbox \n            Layer dependencies (optional) : \"openembedded-core\" link and (trash icon), textbox and \"Add layer\" button \n            Import and add to project : button",
+          "expected_results": " See attachment ImportLayerForm.png"
+        }
+      },
+      "summary": "Verify_that_the_Import_layer_link_shows_the_form"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_that_New_Custom_Image_link_works_and_shows_information",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project \n\n",
+          "expected_results": " Once project is created it should redirect you to a new project configuration page \n\n\n"
+        },
+        "3": {
+          "action": "The configuration details should include  \n    A \"New custom image\" tab that when clicking on, it should display: \n        a Title label that says: \"Select the image recipe you want to customise(#number_or_recipes_available)\" \n        A search textbox with the label of: \"Search and select the image recipe you want to customise\" \n        A \"Search button\" \n        A \"Edit columns\" button \n        A table that will display the customise images available ",
+          "expected_results": "See attachment CustomImage.png"
+        }
+      },
+      "summary": "Verify_that_New_Custom_Image_link_works_and_shows_information"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_most_built_recipe_shows_a_maximum_of_5_recipes",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Build 6 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-lsb, core-image-clutter) to name a few. ",
+          "expected_results": " All recipes are built correctly \n\n"
+        },
+        "4": {
+          "action": "Wait for the recipes to finish ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Go to the configuration details.",
+          "expected_results": " You should see 5 of the 6 recipes that were build. If you order the recipes in alphabetical order you should see that the first 5 made the list. "
+        }
+      },
+      "summary": "Verify_most_built_recipe_shows_a_maximum_of_5_recipes"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_order_sequence_of_listing_in_Most_build_recipes",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Build 6 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-lsb, core-image-clutter) to name a few. \n\n",
+          "expected_results": "All recipes are built correctly \n\n"
+        },
+        "4": {
+          "action": "Wait for the recipes to finish \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Go to the configuration details. \n\n",
+          "expected_results": " If you order the recipes in alphabetical order you should see that the first 5 made the list. Only 5 out of the 6 should make the list. \n\n"
+        },
+        "6": {
+          "action": "Select the 6th recipe that did not make the list and build it again. ",
+          "expected_results": " Since the 6th recipe is now built twice it should make the list and the recipe in the 5th place should not appear."
+        }
+      },
+      "summary": "Verify_order_sequence_of_listing_in_Most_build_recipes"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_Most_build_recipes_multiple_selection",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start toaster",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create a toaster project",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Build 4 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-lsb, core-image-clutter) to name a few. \n\n",
+          "expected_results": " All recipes are built correctly \n\n"
+        },
+        "4": {
+          "action": "Wait for the recipes to finish. \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Go to the configuration details. \n\n",
+          "expected_results": " You should see the 4 recipes in alphabetical order. You should also note that the Build button on the upper right hand corner is disabled since no recipe has been selected. \n\n"
+        },
+        "6": {
+          "action": "Select 1 of the recipes in the most built recipes section. \n\n",
+          "expected_results": "The build button is automatically enabled. \n\n"
+        },
+        "7": {
+          "action": "Select multiple (example 2 or 3) recipes in the most built recipes section. \n\n",
+          "expected_results": " The build button is enabled. \n\n"
+        },
+        "8": {
+          "action": "Click on the build button to start building the recipes.",
+          "expected_results": "One recipe start to build and the others are on queue."
+        }
+      },
+      "summary": "Verify_Most_build_recipes_multiple_selection"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_layer_addition_functionality",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/git/poky",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start toaster",
+          "expected_results": " Once project is created it should redirect you to a new project configuration page. \n\n"
+        },
+        "3": {
+          "action": "Create a toaster project with master release \n    \n\n",
+          "expected_results": " See attachment of layerCanvas.png \n\n\n"
+        },
+        "4": {
+          "action": "Add  layers by typing the name in the \"Type a layer name\" input box and adding by clicking the button. \n\n",
+          "expected_results": " A list of layers with similar name to the one you are typing should appear, giving you the choice to add it.  The default text \"Type a layer name\" should disappear as soon as you start typing.  \n\n"
+        },
+        "5": {
+          "action": "Add layers by clicking on the View compatible layers link just bellow the input text box. \n\n",
+          "expected_results": "This should redirect you to the compatible layers page where a list of compatible layers should appear and allow you to Add layers to the project. \n\n"
+        },
+        "6": {
+          "action": "Add a layer by importing a layer clicking in the Import layer",
+          "expected_results": "This link should redirect you to the import layer form where you will be able to add layers from git repository or a local directory. \n\n\n"
+        }
+      },
+      "summary": "Verify_layer_addition_functionality"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Verify_delete_layer_functionality",
+      "author": [
+        {
+          "email": "libertad.gonzalez.de.la.cruz@intel.com",
+          "name": "libertad.gonzalez.de.la.cruz@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Clone the poky environment     git clone http://git.yoctoproject.org/git/poky\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start toaster",
+          "expected_results": " Once project is created it should redirect you to a new project configuration page.\n\n"
+        },
+        "3": {
+          "action": "Create a toaster project master release  \n   \n",
+          "expected_results": "See attachment of layerCanvas.png  \n\n"
+        },
+        "4": {
+          "action": "Remove openembedded-core layer from the project by clicking the trash icon next to it.  \n\n",
+          "expected_results": "The layer should disappear from the list and a notification should appear at the top of the page saying: \"You have removed 1 layer from your project: \".  The layer_name should be a link to the corresponding layer detail page. The layer counter next to the \"layers\" heading should decrease by one. \n"
+        },
+        "5": {
+          "action": "Remove all the layers from the project",
+          "expected_results": " you should see a message that reads:  \n\nYou need to add some layers. For that you can:  \n\n-View all layers compatible with this project  \n\n-Import a layer  \n\n-Read about layers in the documentation  \n\nOr type a layer name below.  \n\n\n The \"Choose from the layers compatible with this project\" link should go to the compatible layers page The \"Import a layer\" link should go to the import layer page The \"Read about layers in the documentation\" link should open in a new window and bring you to http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#understanding-and-creating-layers"
+        }
+      },
+      "summary": "Verify_delete_layer_functionality"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Download_task_log",
+      "author": [
+        {
+          "email": "alexandru.costinx.roman@intel.com",
+          "name": "alexandru.costinx.roman@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start Toaster. ",
+          "expected_results": "Toaster starts."
+        },
+        "2": {
+          "action": "Click on new project button.\n\n",
+          "expected_results": "Open create a new project page."
+        },
+        "3": {
+          "action": " Enter a project name, select a release and click on create project or select an existing project. \n\n",
+          "expected_results": "Project Created."
+        },
+        "4": {
+          "action": "Build a recipe (ex: core-image-minimal). \n\n",
+          "expected_results": "Build finish."
+        },
+        "5": {
+          "action": "Click on the built recipe. \n\n",
+          "expected_results": "Open build summary page."
+        },
+        "6": {
+          "action": "Click on tasks tab. \n\n",
+          "expected_results": "Open tasks page."
+        },
+        "7": {
+          "action": "Click on a task executed successfully. \n\n",
+          "expected_results": "Open task page."
+        },
+        "8": {
+          "action": "Click on \"Download task log\" button. \n",
+          "expected_results": "You can download the task log. \n"
+        },
+        "9": {
+          "action": "Click on a failed task.  \n",
+          "expected_results": "Open task page, not appear download task \n"
+        }
+      },
+      "summary": "Download_task_log"
+    }
+  }
+]
\ No newline at end of file
diff --git a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
new file mode 100644
index 0000000..e614b14
--- /dev/null
+++ b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
@@ -0,0 +1,1170 @@
+[
+  {
+    "test": {
+      "@alias": "toaster.toaster.Create_a_Yocto_project_and_start_the_Toaster",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone git://git.yoctoproject.org/poky  \n\n",
+          "expected_results": "NA \n\n"
+        },
+        "2": {
+          "action": "Start up toaster. \ncd ${installdir} \nsource poky/oe-init-build-env \nsource toaster start  \n\n",
+          "expected_results": "  \nlog: \nThe system will start. \nSyncing... \nCreating tables ... \nCreating table south_migrationhistory \nInstalling custom SQL ... \nInstalling indexes ... \nInstalled 0 object(s) from 0 fixture(s) \n > south  \n\nNot synced (use migrations): \n - orm \n(use ./manage.py migrate to migrate these) \nRunning migrations for orm: \n - Migrating forwards to 0004_auto__add_field_package_installed_name. \n > orm:0001_initial \n > orm:0002_auto__add_field_build_timespent \n > orm:0003_timespent \n - Migration 'orm:0003_timespent' is marked for no-dry-run. \n > orm:0004_auto__add_field_package_installed_name \n - Loading initial data for orm. \nInstalled 0 object(s) from 0 fixture(s) \nserver address: 127.0.0.1, server port: 8200 \nSuccessful start."
+        },
+        "3": {
+          "action": "Build the yocto project. \nbitbake core-image-minimal  \n\n",
+          "expected_results": "Build successfully. \n"
+        },
+        "4": {
+          "action": "Use a default web brower to see project build process. \nxdg-open http://localhost:8000/ \nWait for build completion. \n",
+          "expected_results": "You can open http://localhost:8000/ in a default browser. The build process is showed. "
+        }
+      },
+      "summary": "Create_a_Yocto_project_and_start_the_Toaster."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Sort_the_content_of_the_builds_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start up toaster.",
+          "expected_results": "Succeed to start up toaster. "
+        },
+        "2": {
+          "action": "Create 2 builds, such as \"bitbake core-image-minimal\" and \"bitbake core-image-sato\". Wait for successful builds and then run: http://localhost:8000/",
+          "expected_results": "Succeed to build the targets. "
+        },
+        "3": {
+          "action": "Enter \"All build\" table in web browser.",
+          "expected_results": "NA "
+        },
+        "4": {
+          "action": "Click \"Completed on\" component to sort.",
+          "expected_results": "Build targets are sorted out by the \"Completed on\". "
+        },
+        "5": {
+          "action": "Click \"Completed on\" component again to invert the sorting .",
+          "expected_results": "The sorting is inverted. "
+        },
+        "6": {
+          "action": "Have a sort try in other columns. outcome, machine, started on, completed on, errors, warnings, project.",
+          "expected_results": "See item 4 and 5."
+        }
+      },
+      "summary": "Sort_the_content_of_the_builds_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Search_the_content_of_the_builds_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start up toaster.",
+          "expected_results": "NA "
+        },
+        "2": {
+          "action": "Create 2 builds, such as \"bitbake core-image-minimal\" and \"bitbake core-image-sato\". Wait for successful builds and then run: xdg-open http://localhost:8000/",
+          "expected_results": "NA "
+        },
+        "3": {
+          "action": "Enter \"All build\" table in web browser.",
+          "expected_results": "NA "
+        },
+        "4": {
+          "action": "Input a string in search component and click search.",
+          "expected_results": "Show returned search results. When no search query has been entered, we have placeholder text saying: \"Search builds\". The placeholder text disappears when the first character is typed. "
+        },
+        "5": {
+          "action": "See returned search results.",
+          "expected_results": "If your search query returns no results, the section heading changes to \"No builds found\", and we show you an alert with a search form and an option to show all builds. "
+        },
+        "6": {
+          "action": "Click \"Clear search\" icon (icon-remove-sign). Observe all builds are showed. ",
+          "expected_results": "Click it to clear the search and display all builds."
+        }
+      },
+      "summary": "Search_the_content_of_the_builds_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Filter_the_content_of_the_builds_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start up toaster.",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create 2 builds, such as \"bitbake core-image-minimal\" and \"bitbake core-image-sato\". Wait for successful builds and then run: xdg-open http://localhost:8000/.",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Enter \"All build\" table in web browser.",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Make sure the following table columns have filters. \n- Outcome \n-- Started on \n- Completed on \n- Failed tasks",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Filters are mutually exclusive. Click a filter button of a one column and a filter dialogue occurs. Select a filter item. The filter result would be showed. Then select another filter item of another column and the previously applied filter is overridden by the newly selected filter when a filter from a different column is applied to the table. In this state, we show some help text next to the \"Apply\" button, saying \"You can only apply one filter to the table. This filter will override the current filter.\"",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Filters are overridden by search. Run a search query and you can see previous filter results are overridden by the results of the search query.",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Have a try in filters of the following table columns. \n- Outcome \n- Started on \n- Completed on \n- Failed tasks \n",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "Filter_the_content_of_the_builds_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Tasks_in_toaster_UI",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " === TOASTER: Test Instructions for \"Tasks\", \"Time\", \"CPU Usage\", and \"Disk I/O\" pages ===   \n \nNOTE TO TESTERS: The three pages \"Time\", \"CPU Usage\", and \"Disk I/O\" are simple variations on the \"Tasks\" page. Those test instructions will demonstrate the respective unique parts.   \n \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".   \n \n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "In Toaster, select the build, and select the \"Tasks\" link in the left sidebar   \n \n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Breadcrumbs   \n \n  * Observe that the 4 breadcrumbs at the top left are:   \n     \n                           : a live link that will take you back to the project page  \n                  \t: a live link that will take you back to the project Builds page \n                          : a live link that will take you back to the image dashboard page \n                          \"Tasks\"   \n \n  * Test the breadcrumb live links, return to this page   \n \n \n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "General Layout   \n \n  * Observe the left-hand box with links to the other pages of the build   \n   \n  * Observe the title of the table is \"Tasks\", in bold   \n   \n  * Observe the search/filter bar above the table   \n   \n  * Observe the number of table rows in each page matches the number selected in the \"Show rows\" dropdown menu   \n   \n  * Observe at the bottom of the page the \"Showing XX to XX out of xxx entries\", the page selection links, and the \"Show Rows\" selection.   \n \n \n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Columns   \n \nNote: to restore the default columns in your browser, for example in Firefox, select \"Tools > Privacy > remove individual cookies\", find the cookies for the IP address of the Toaster engine (for example \"localhost\"), and remove each sub-cookie with the prefix \"_displaycols_*\" (or the whole cookie if those are the only sub-cookies).   \n \n  * Observe that the default columns are:    \n   \n    \"Order, Recipe, Task, Executed, Outcome, Cache attempt\"   \n \n  * Click the \"Edit Columns\" button. ",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Observe that the fields are sorted as follows (with the indicated items greyed)   \n \n    [ ] CPU usage  \n    [x] Cache attempt  \n    [ ] Disk I/O (ms)  \n    [x] Executed  \n    [x] Order            {greyed}  \n    [x] Outcome  \n    [x] Recipe           {greyed}  \n    [ ] Recipe version  \n    [x] Task             {greyed}  \n    [ ] Time (secs)    \n \n  * For each of the greyed items, attempt to click them. Observe that they do not change.   \n \n  * For each of the non-greyed items, attempt to click them. Observe that the respective column dynamically appears when checked and disappears when un-checked. ",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Search   \n \n  * Observe that the search text box background text is \"Search tasks\".   \n   \n  * Set the search text to \"busybox\" and click \"Search\". Observe that only the busybox tasks are listed (about 16).   \n   \n  * Click the \"X\" next to the search text box. Observe that all of the tasks re-appear.   \n \n \n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Column sorts   \n \n  * Enable all of the columns.   \n   \n  * Observe that by default the \"Order\" column header is in bold, it has a down-arrow icon, and that the table is sorted by this column in ascending order.   \n   \n  * Observe that the columns are in this order, and are sortable only if indicated:   \n   \n    Order                    {sortable}  \n    Recipe                     {sortable}  \n    Recipe version  \n    Task                       {sortable}  \n    Executed                   {sortable}  \n    Outcome                    {sortable}  \n    Cache attempt              {sortable}  \n    Time (secs)                {sortable}  \n    CPU usage                  {sortable}  \n    Disk I/O (ms)              {sortable}  ",
+          "expected_results": ""
+        },
+        "10": {
+          "action": " Test that each of the sortable columns do sort, ascending and descending   \n \n  * Observe that each of the column headers have a question mark icon, and that hovering over it provides help text.",
+          "expected_results": ""
+        },
+        "11": {
+          "action": "\"Executed\" Filter    \n \n  * Observe that the \"Executed\" column has the filter icon. Click on it and observe these values, where \"All Tasks\" is the default   \n \n    (*) All Tasks   \n    ( ) Executed Tasks   \n    ( ) Not Executed Tasks    \n \n  * Click on \"Executed Tasks\" and observe that only rows with the value \"Executed\" are displayed.   \n \n  * Click on \"Not Executed Tasks\" and observe that only rows with the value \"Not Executed\" are displayed.   \n \n  * Click on \"All Tasks\" and observe that all rows are displayed.   \n \n \n",
+          "expected_results": ""
+        },
+        "12": {
+          "action": "\"Outcome\" Filter    \n \n  * Observe that the \"Outcome\" column has the filter icon. Click on it and observe these values, where \"All Tasks\" is the default   \n \n    (*) All Tasks   \n    ( ) Succeeded Tasks   \n    ( ) Failed Tasks   \n    ( ) Cached Tasks   \n    ( ) Prebuilt Tasks   \n    ( ) Covered Tasks   \n    ( ) Empty Tasks    \n \n  * Click on each of the filter selections, and observe that the resulting row \"Outcome\" values match the selection.    \n \n  * Click on \"All Tasks\" and observe that all rows are displayed.   \n \n \n1",
+          "expected_results": ""
+        },
+        "13": {
+          "action": "\"Cache attempt\" Filter    \n \n  * Observe that the \"Cache attempt\" column has the filter icon. Click on it and observe these values, where \"All Tasks\" is the default   \n \n    (*) All Tasks   \n    ( ) Tasks with cache attempts   \n    ( ) Tasks with 'File not in cache' attempts   \n    ( ) Tasks with 'Failed' cache attempts   \n    ( ) Tasks with 'Succeeded' cache attempts     \n \n  * Click on each of the filter selections, and observe that the resulting row \"Outcome\" values match the selection.   \n   \n    Note the with a clean build, only the \"All Tasks\" and \"Tasks with cache attempts\" will return rows.  \n \n  * Click on \"All Tasks\" and observe that all rows are displayed.   \n \n \n1",
+          "expected_results": ""
+        },
+        "14": {
+          "action": "Order, Task, Executed, Outcome, Cache attempt links   \n \n  * Observe that for a given row, the above values are live links that will both take you to the respective task detail page. Click the back button to return.  \n\n  * Observe that for a given row the values in \"Recipe\" and \"Recipe version\" are live links that will both take you to the respective recipe details page. Click the back button to return   \n \n \n1",
+          "expected_results": ""
+        },
+        "15": {
+          "action": "Time Page   \n \n  * \"In Toaster, select the build, and select the \"Time\" link in the left sidebar   \n \n  * Observe that the default columns are:    \n   \n    \"Recipe\", \"Task\", \"Executed\", \" Outcome\", \"Time (secs)\"   \n \n  * Observe that the default sort is \"Time (secs)\", in descending order.   \n   \n  * In the \"Edit Columns\" button, turn on all of the columns.   \n   \n  * Observe that the page now matches the \"Tasks\" page, and passes the same tests.   \n \n \n1",
+          "expected_results": ""
+        },
+        "16": {
+          "action": "CPU Usage Page   \n \n  * \"In Toaster, select the build, and select the \"CPU Usage\" link in the left sidebar   \n \n  * Observe that the default columns are:    \n   \n    \"Recipe\", \"Task\", \"Executed\", \"Outcome\", \"CPU Usage\"   \n \n  * Observe that the default sort is \"CPU Usage\", in descending order.   \n   \n  * In the \"Edit Columns\" button, turn on all of the columns.   \n   \n  * Observe that the page now matches the \"Tasks\" page, and passes the same tests.   \n \n \n1",
+          "expected_results": ""
+        },
+        "17": {
+          "action": "Disk I/O Page   \n  \n   * \"In Toaster, select the build, and select the \"Disk I/O\" link in the left sidebar   \n  \n   * Observe that the default columns are:    \n    \n     \"Recipe\", \"Task\", \"Executed\", \"Outcome\", \"Disk I/O (ms)\"   \n  \n   * Observe that the default sort is \"Disk I/O (ms)\", in descending order.   \n    \n   * In the \"Edit Columns\" button, turn on all of the columns.   \n    \n   * Observe that the page now matches the \"Tasks\" page, and passes the same tests. ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "Tasks_in_toaster_UI"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.package_detail_in_toaster_UI",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "TOASTER: Test Instructions for \"Package Detail\" page   \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "In Toaster, select the build, and select the \"Packages\" link in the left sidebar.",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Select a package from the \"Package\" column.",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Breadcrumbs  \n  * Observe that the 3 breadcrumbs at the top left are:   \n    : a live link that will take you back to the image dashboard page \n    \"Packages\": a live link that will take you back to the Packages page  \n    \"bash\": the name of the current package  (not a link)        \n  * Test the breadcrumb live links, return to this page ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "General Layout \n  * Click on any package \n  * Observe that there is no the left-hand box   \n  * Observe that there is a right-hand box, with information about the package \n  * Observe the title is the package name and version, in bold  \n  * Observe that, if the package is installed in an image, there is a link to the image(s) the package appears in  \n  * Observe that, if the package is not installed in the image, there are two tab buttons below the title ",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Observe that the tab buttons are:  \n    Generated files (2)        {highlighted}  \n    Runtime dependencies (4)  \n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Generated files tab  \n  * Click the \"Generated files\" tab (which should be selected by default)  \n  * Observe that the number of files in the table matches the number in parenthesis after the \"Generated files\" tab title. \n  * Observe that the columns in the table are \"File\" and \"Size\"  \n  * Observe that the table is sorted by \"File\" in ascending alphabetical order (A to Z). ",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Runtime dependencies tab  \n  * Click the \"Runtime dependencies\" tab  \n  * Observe that the number of dependencies in the table matches the number in parenthesis after the \"Runtime dependencies\" tab title.  \n  * Observe that the columns in the table are:  \n    \"Package, Version, Size\"  \n  * Observe that the table is sorted by Package in ascending alphabetical order (A to Z)  \n  * Observe that the package name values are live links to the respective package details page. ",
+          "expected_results": "The information icon was eliminated on the columns that where self explanatory.  "
+        },
+        "10": {
+          "action": "Package information box  \n  * Observe that there is a right-hand box, with information about the package, including in this example the fields:  \n    \"Size, License, Recipe, Recipe version, Layer, Layer branch, Layer commit\"  \n  * Observe that each of the field has a question mark icon, and that hovering will provide help text.  \n  * Observe that none of the values in the right-hand box are blank  \n  * Observe that the \"Recipe\" value is a live link to the respective recipe detail page.  ",
+          "expected_results": ""
+        }
+      },
+      "summary": "package_detail_in_toaster_UI"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.recipes:_Sort_the_content_of_the_recipes_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".   \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Recipes\" link in the left sidebar.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Make sure that by default the \"Recipes\" table is sorted by \"Recipe\" in ascending alphabetical order (A to Z).  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Sort my \"Recipes\" table by \"Section\" and then navigate away by selecting a recipe(such as click busybox recipe). When you click \"back\" button in web-browser to go back to the \"Recipes\" table it should still be sorted by \"Section\".  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Make sure all column headings are sortable, except \"Recipe version\", \"Dependencies\", \"Reverse dependencies\" and \"Layer commit\".  \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Sorting and \"Edit columns\" \nIf you use the \"Edit columns\" menu to hide the column with the applied sorting, we revert the sorting to the default sorting (i.e. \"Recipe\"). The default sorting always uses one of the core columns, which cannot be hidden using the \"Edit columns\" menu. \nSort recipes by \"section\" column heading. Then hide \"Section\" column by \"Edit columns\". Make sure that the \"Recipes\" table is sorted by \"Recipe\" in ascending alphabetical order (A to Z). \nNOTE: Bug 5919 is filed against the issue.  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Sorting and search \nSearching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted. \nSort recipes by \"section\" column heading. Input a string (such as \"lib\") in search box and click search button. Make sure results returned should be sorted by \"section\". \n",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "recipes:_Sort_the_content_of_the_recipes_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.recipes:_Search_the_content_of_the_recipes_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "recipes: Search the content of the recipes table  \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".   \n \n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "In Toaster, select the build, and select the \"Recipes\" link in the left sidebar.  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Observe the search is made of a text input field and a \"Search\" button in a toolbar above the table.  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "When no search query has been entered, we have placeholder text saying: \"Search recipes\".  \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Input \"lib\" in the text input field. The placeholder text disappears when the first character is typed. Click search button.  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": " \n(1) returned results \nThe search string is kept in the text input field. The results returned occur. Click  \"Clear search\" icon to clear the search and display all recipes. \n(2) no results returned \nIf your search query returns no results, the page heading changes to \"No recipes found\", and we show you an alert with a search form and an option to show all recipes. Observe \"show all recipes\" button is available.  \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "When I run a search, the search happens against the following columns (independently of they being shown or hidden): \n- Recipe \n- Recipe version \n- Recipe file \n- Section \n- License \n- Layer \n- Layer branch \n- Layer commit  \n\nInput a string to search for the above 8 column headings separately to make sure that the search happens against the columns.  \n\n \n\n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Search, sorting and \"Edit columns\"  \nSearching does not change the state of the table: the same columns remain hidden and the same sorting applied when search results are displayed, but filters are cleared by the search results.\nSearch a string and make sure that the same columns remain hidden and the same sorting applied. Since filter feature of recipes (4296) is obsolete, we don't have to test filter.  \n\n",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "Search and filters \nThe scope of the filters is the content currently on the table (this means all table pages, not only the one displayed). The scope of the search is always the content of the database.\nSince filter feature of recipes (4296) is obsolete, we don't have to test filter.  \n\nIf I run a search query, any filter applied afterwards will filter the content returned by the search query.  \n\nIf I run a search query while a filter is applied, the filter is cleared by the results of the search query (i.e. we display the results of the search query and clear the filter applied beforehand).",
+          "expected_results": "NA"
+        },
+        "11": {
+          "action": " The same happens if I click the \"Clear search\" icon when a filter is applied to a set of search results (both search results and applied filter are cleared, and the table shows all the tasks). \nSince filter feature of recipes (4296) is obsolete, we don't have to test filter. \n\n",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "recipes:_Search_the_content_of_the_recipes_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.recipes:_Customise_the_columns_of_the_recipes_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".   \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Recipes\" link in the left sidebar.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "* Observe that the default columns are:   \n    \"Recipe, Recipe version, Recipe file, Section , License, Layer\"   \n \n  * Click the \"Edit Columns\" button.  \n  * Observe that the fields are sorted as follows (with the indicated items greyed)  \n    [ ] Dependencies  \n    [x] Layer  \n    [ ] Layer branch  \n    [ ] Layer commit  \n    [x] License  \n    [x] Recipe                   {greyed}  \n    [x] Recipe file  \n    [x] Recipe version        {greyed}  \n    [ ] Reverse dependencies  \n    [x] Section    \n \n  * For each of the greyed items, attempt to click them. Observe that they do not change.  \n  * For each of the non-greyed items, attempt to click them. Observe that the respective column dynamically appears when checked and disappears when un-checked.\n",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "recipes:_Customise_the_columns_of_the_recipes_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.recipes:_View_a_table_with_all_the_recipes_included_in_an_image_recipe",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".   \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Recipes\" link in the left sidebar.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "By default, the all recipes table displays the following columns in this order: \n(1) Recipe (2) Recipe version: the target version and revision (3) Dependencies (4)Reverse Dependencies  (5) License: the value of the target's LICENSE variable (6) Layer: the name of the layer providing the target  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "In the \"Edit columns\" menu, table columns appear listed alphabetically. \nIn the table itself, the default order of columns is as follows: \n(1) Dependencies (2) Layer (3) Layer branch (4) Layer commit (5) License (6) Recipe (7) Recipe file  (8) Reverse dependencies (9) Section (10) Version  \n\nThe minimum table is made of the 2 columns that provide the information needed to identify a target: Recipe and Recipe version.",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "recipes:_View_a_table_with_all_the_recipes_included_in_an_image_recipe"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.recipes:_View_detailed_information_about_a_recipe。",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Create a default Yocto project (qemux86), and start the Toaster.  \n \n  $ source poky/oe-init-build-env \n  $ source toaster start \n  $ bitbake core-image-minimal \n  $ http://localhost:8000/  \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Select the \"core-image-minimal\" build link  \n \n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Select the \"Recipes\" link in the left sidebar  \n \nObserve that the recipes are listed in a table, and that each recipe name is a live URL link.  \n \n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Observe that \"Packages\" link. It should have an appended value like \"(4)\". Now click on this link.  \n \nObserve: \n  a) The number of packages matches the previous number in parenthesis.  \n \n  b) Each package has a version and a size. The size may be zero.  \n \n  c) Note that if you hover on a package name, it will reveal a URL of the following form. This link should take you to the corresponding package detail page.  \n \n        localhost:8000/gui/build//package/   \n \n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe that recipes of \"Build Dependencies\" link has an appended value like \"(0)\". Now click on this link.  \n \nObserve: \n  a) No dependencies appear, and you get a message of the form:  \n \n  \"$RECIPE_NAME_VERSION has no build dependencies.\"  \n \n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Observe that \"Reverse build dependencies\" link has an appended value like \"(1)\". Now click on this link.  \n \nObserve: \n  a) The number of packages matches the previous number in parenthesis.  \n \n  b) The recipe dependency should be \"packagegroup-core-boot\",  \n \n  c) There should be a respective version displayed, for example \"1.0-r11\"  \n \n  d) If you hover on the recipe name, it will reveal a URL of the following form. This link should take you to the corresponding recipe detail page.  \n \n        localhost:8000/gui/build//recipe/  \n \n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Click the breadcrumb \"Recipes\" at the top, locate the \"gdbm\" recipe, and select it.  \n \n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Observe that \"Packages\" link. It should have an appended value like \"(0)\". Now click on this link.  \n \nObserve: \n  a) No packages appear, and you get a message of the form:  \n \n  \"$PACKAGE_NAME_VERSION does not build any packages.\"  \n \n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Observe that \"Build dependencies\" link. It should have an appended value like \"(2)\". Now click on this link.  \n \nObserve: \n  a) The number of build dependencies matches the previous number in parenthesis.  \n \n  b) The recipe dependency should have values like \"gettext-native\" and \"libtool-cross\".  \n \n  c) There should be a respective versions displayed for each dependency.  \n \n  d) If you hover on a recipe name, it will reveal a URL of the following form. This link should take you to the corresponding recipe detail page.  \n \n        localhost:8000/gui/build//recipe/  \n \n1",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "Observe that \"Reverse build dependencies\" link. It should have an appended value like \"(0)\". Now click on this link.  \n \nObserve: \n  a) No reverse dependencies appear, and you get a message of the form:  \n \n  \"$RECIPE_NAME_VERSION does not build any packages.",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "recipes:_View_detailed_information_about_a_recipe。"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.variables:_Search_the_content_of_the_bitbake_variables_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".   \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Configuration\" link in the left sidebar. Then click \"BitBake variables\" tab.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "When no search query has been entered, we have placeholder text saying: \"Search BitBake variables\".   \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Input \"lib\" in text input field. The placeholder text disappears when the first character is typed. Click search button.  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe \"4 variables found\" is showed. (It may be other number.)  \n  If your search query returns no results, we display an alert with: \n    - A h3 heading saying: \"No variables found\" \n    - A search box \n    - The search query is showed in the text input shield. \n    - A link to show all variables. we show the variables table.  \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "We provide a \"Clear search\" icon (icon-remove-sign). Click it to clear the search and display all variables. Check that the \"Clear search\" icon cannot be accessed using the tab key.   \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Verify search scope. \nWhen I run a search, the search happens against the following columns (independently of they being shown or hidden): \n- Variable \n- Value \n- Set in file \n- Description  \n\n",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Verify \"search, sorting and 'Edit columns'\" \nSearching does not change the state of the table: the same columns remain hidden and the same sorting applied \nwhen search results are displayed, but filters are cleared by the search results.  \n\n",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Search and filters \nIf I run a search query, any filter applied afterwards will filter the content returned by the search query. \nIf I run a search query while a filter is applied, the filter is cleared by the results of the search query. \n",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "variables:_Search_the_content_of_the_bitbake_variables_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.variables:_Sort_the_content_of_the_bitbake_variables_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".  \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Configuration\" link in the left sidebar. Then click \"BitBake variables\" tab. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "By default, the \"variables\" table is sorted by \"Variable\" in ascending alphabetical order (A to Z). \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Make sure that \"Variable\" column is sortable (Developers have disabled sort function of all other columns to avoid bug 6004) \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Sorting and search \nSearching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted.",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "variables:_Sort_the_content_of_the_bitbake_variables_table."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.builds:_View_a_table_of_all_the_builds_run_for_a_certain_build_directory",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start up toaster and open localhost:8000. ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "You can see 'Latest builds' section lists. - Builds in progress, sorted by inverse start time (last one starting at the top). - 3 latest completed builds, as long as they are less than 24 hours old.  If there are no builds in progress or builds completed within the last 24 hours we don't display it: the page shows only the 'All builds' section. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "You can see the following column headings. You can see the their description in https://bugzilla.yoctoproject.org/attachment.cgi?id=1617. outcome, recipe, machine, started on, completed on, failed tasks, errors, warnings, time, image files, project",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "builds:_View_a_table_of_all_the_builds_run_for_a_certain_build_directory"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.builds:_Customise_the_columns_of_the_builds_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start up toaster.",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Create 2 builds, such as \"bitbake core-image-minimal\" and \"bitbake core-image-sato\". Wait for successful builds and then run: xdg-open http://localhost:8000/",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Enter \"All build\" table in web browser.",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Select a few item in \"Edit columns\" to show or hide them in all builds.",
+          "expected_results": "Unchecked items changed to checked should immediately appear in the table.   Checked items changed to unchecked should immediately disappear from the table.   If you uncheck the column with the applied sorting, when you close the \"Edit columns\" menu the applied sorting should revert to the table default sorting. Bug 5919 is filed for the function."
+        }
+      },
+      "summary": "builds:_Customise_the_columns_of_the_builds_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.packages:_View_a_table_with_all_the_packages_built_for_an_image_recipe",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Packages\" link in the left sidebar. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "By default, the built packages table displays the following columns in this order:  Package, Package version, Size ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Apart from the columns shown by default, the following additional columns are also available to users via the \"Edit columns\" menu:  Layer, Layer branch, Layer commit, License, Recipe version  ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Enable these columns and observe that table columns appear listed alphabetically in the \"Edit columns\" menu (1)Package (2)Package version (3)Size (4)License (5)Recipe (6)Recipe version (7)Layer (8)Layer branch (9)Layer commit ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "The minimum table is made of the 2 columns that provide the information needed to identify a package: Package and Package version. Their corresponding checkboxes in the \"Edit columns\" menu appear always selected and are in an inactive state.  ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "packages:_View_a_table_with_all_the_packages_built_for_an_image_recipe"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.packages:_Sort_the_content_of_the_packages_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Packages\" link in the left sidebar. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe that by default the \"built packages\" table is sorted by \"Package\" in ascending alphabetical order (A to Z). ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Click \"Size\" column heading to sort my \"built packages\" table by \"Size\". Then navigate away by selecting a package and you can see the package page. After click \"go back\" button in browser to return to the \"built packages\" table it should still be sorted by \"Size\". ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe that all except \"Package version\", \"Recipe version\", \"Layer commit\" are sortable. ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "If you use the \"Edit columns\" menu to hide the column with the applied sorting, we revert the sorting to the default sorting (i.e. \"Package\"). The default sorting always uses one of the core columns, which cannot be hidden using the \"Edit columns\" menu.   Bug 5919 is filed for the issue. ",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Searching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted.  Sort packages by size and search a string. Observe that results returned should be sorted by size. ",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "In Toaster, select the build, and select the \"core-image*\" link in the left sidebar. Observe that by default the \"built packages\" table is sorted by \"Package\" in ascending alphabetical order (A to Z).  ",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "If choose to sort my \"included packages\" table by \"Size\" and then navigate away by selecting a package, when I go back to the \"included packages\" table it should still be sorted by \"Size\".  ",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "Enable all columns by \"Edit columns\". All except \"Package version\", \"Recipe version\", \"Dependencies\", \"Reverse dependencies\", \"Layer commit\", should be sortable.  ",
+          "expected_results": ""
+        },
+        "11": {
+          "action": "If you use the \"Edit columns\" menu to hide the column with the applied sorting, we revert the sorting to the default sorting (i.e. \"Package\"). The default sorting always uses one of the core columns, which cannot be hidden using the \"Edit columns\" menu.  Bug 5919 is filed for the issue.  ",
+          "expected_results": ""
+        },
+        "12": {
+          "action": "Searching should have no impact on the applied sorting. Any results returned should be sorted by the sorting criteria selected when the search query was submitted. Sort packages by size and search a string. Observe that results returned should be sorted by size.",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "packages:_Sort_the_content_of_the_packages_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.packages:_Customise_the_columns_of_the_packages_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Packages\" link in the left sidebar. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe that by default the \"built packages\" table is sorted by \"Package\" in ascending alphabetical order (A to Z). ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Select 1 column in \"Edit column\" to show the column. ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Deselect 1 column in \"Edit column\" to hide 1 column by \"Edit columns\".",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "packages:_Customise_the_columns_of_the_packages_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.packages:_Search_the_content_of_the_packages_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Packages\" link in the left sidebar. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe that by default the \"built packages\" table is sorted by \"Package\" in ascending alphabetical order (A to Z). ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "When no search query has been entered, we have placeholder text saying: \"Search packages built\". The placeholder text disappears when the first character is typed. ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "When a search query has been submitted and results returned: ▪ We keep the search string in the text input field. ▪ We provide a \"Clear search\" icon (icon-remove-sign). Click it to clear the search and display all packages. ▪ We change the page heading to indicate the number of results returned by the search query. ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "If your search query returns no results, the page heading changes to \"No packages found\", and we show you an alert with a search form and an option to show all packages. ",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Searching does not change the state of the table: the same columns remain hidden and the same sorting applied. ",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "When I run a search, the search happens against the following columns (independently of they being shown or hidden): - Package - Package version - License - Recipe - Recipe version - Layer - Layer branch - Layer commit ",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Hide all columns except \"Package\" and \"Package version\". Search a string which is included in other hidden columns, not the 2 columns. See if returned results occur. ",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "In Toaster, select the build, and select the \"core-image*\" link in the left sidebar. Observe that by default the \"included packages\" table is sorted by \"Package\" in ascending alphabetical order (A to Z). Rerun tests according to step 4~9.",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "packages:_Search_the_content_of_the_packages_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.View_detailed_information_about_a_layer",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". \n\n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Make sure that layer information is shown in: \n* recipes table \n    All builds-> core-image-minimal-> recipes \n    Select \"Layer\", \"Layer branch\", \"Layer commit\" in Edit columns and observe the 3 columns are showed. Note that the \"Layer branch\" column can be empty.   \n\n* recipe details  \n    All builds-> core-image-minimal-> recipes \n    Click a recipe and you can see \"Layer\", \"Layer branch\", \"Layer commit\", \"Recipe details\" information.  Note that \"Layer branch\" is not required. If there is no layer branch, you should not see the \"Layer branch\" item on the list.",
+          "expected_results": "NA"
+        },
+        "3": {
+          "action": "built packages table \n    All builds-> core-image-minimal-> packages \n    Select \"Layer\", \"Layer branch\", \"Layer commit\"  in Edit columns and observer the 3 columns is showed. Note that the \"Layer branch\" column can be empty.   \n\n* built package details \n    All builds-> core-image-minimal-> packages \n    Click a package and you can see \"Layer\", \"Layer branch\", \"Layer commit\" in package information. Note that \"Layer branch\" is not required. If there is no layer branch, you should not see the \"Layer branch\" item on the list.  \n\n* image information \n     All builds-> core-image-minimal-> core-image-minimal(images) \n    Select \"Layer\", \"Layer branch\", \"Layer commit\" in Edit columns and observer the 3 columns is showed.",
+          "expected_results": "NA"
+        },
+        "4": {
+          "action": "Note that the \"Layer branch\" column can be empty.   \n\n* installed package details \n    All builds-> core-image-minimal-> core-image-minimal(images) \n    Click a package and you can see layer information in package information. Note that \"Layer branch\" is not required. If there is no layer branch, you should not see the \"Layer branch\" item on the list.  \n\n* configuration \n    All builds-> core-image-minimal-> Configuration \n    You can see \"Layer\", \"Layer branch\", \"Layer commit\"  in configuration summary. Note that the \"Layer branch\" column can be empty.  \n\n* build dashboard \n    All builds-> core-image-minimal \n    You can see \"Layers\" in build summary. ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "View_detailed_information_about_a_layer"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Select_the_number_of_table_rows_displayed_per_page",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Packages\" link in the left sidebar. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Users can select the number of rows they want to see in a table using the \"Show rows\" dropdown menu, which displays above and below each table. The options of the \"Show rows\" dropdown are: 10, 25, 50, 100, 150. ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "The last selected option from the \"Show rows\" menu should be remembered:  * Select one option, for example 10 * Click on a package name to navigate away from the built packages table * Click on the \"Packages\" link in the breadcrumb at the top of the page to go back to the packages table  Note that 25 is still selected in the \"Show rows\" menu.  ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe that the pagination widget is made of: - A \"Previous\" button - A \"Next\" button - A maximum of 5 page buttons.  ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "See the pagination function of \"Tasks\", \"Recipes\" links according to steps 3~4.",
+          "expected_results": "Expected result for step 4: This widget has no previous or next button if testing in toaster 2.2. see Bug 9831"
+        }
+      },
+      "summary": "Select_the_number_of_table_rows_displayed_per_page"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.View_detailed_configuration_information_for_a_build",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Configuration\" link in the left sidebar. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe that the configuration page has 2 tabs: - Summary - BitBake variables The Summary tab is the default tab. ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "The following content is included in summary tab.  (1) Build configuration  (2) Layers (Layer, Layer branch - if any, Layer commit) ",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe that \"BitBake variables\" tab includes \"Variable\", \"Value\", \" Set in file\", \"Description\" columns. ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Click filter button of \"Set in file\" column. Select \"Local configuration variables\" and click \"Apply\" button to see if filter function works well. ",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "In the \"Edit columns\" menu, table columns appear listed alphabetically: Description, Set in file, Value, Variable ",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "The minimum table is made of the \"Variable\" and \"Value\" columns. ",
+          "expected_results": ""
+        },
+        "9": {
+          "action": "Click a variable and a \"History of ${variable}\" dialog will occur. The modal dialog shows the variable value followed by the history table, which has the following columns: - Order: indicates the sequence in which the files set the variable - Configuration file: the location in disk of the file that set the variable - Operation: the value of the operation field as stored in the database. - Line number: the line number where the operation is performed in the configuration file.  For such variables, whose value is an empty string, the Value cell in the variables table isempty, which is probably the right thing. In the modal, instead of the variable value, we show an alert (with the class .alert-info) saying: \"The value of  is an empty string\"  ",
+          "expected_results": ""
+        },
+        "10": {
+          "action": "Click arrow links in description tab to see linking variables to the Yocto Project reference manual.",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "View_detailed_configuration_information_for_a_build"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.variables:_Customise_the_columns_of_the_bitbake_variables_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Configuration\" link in the left sidebar. Then click \"BitBake variables\" tab. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Show or hide columns by select or deselect options of \"Edit columns\".",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "variables:_Customise_the_columns_of_the_bitbake_variables_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.variables:_Filter_the_content_of_the_bitbake_variables_table",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\". \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"Configuration\" link in the left sidebar. Then click \"BitBake variables\" tab. \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe \"Set in file\" and \"Description\" columns have filters. \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Filters are mutually exclusive. Only one column filter can be applied to a table at any given time.  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Filters are overridden by search. \nThe scope of the filters is the content currently on the table. \nThe scope of the search is always the full content of the database. \nSo: \n- if I run a search query, any filter applied afterwards will filter the content returned by the search query. \nSearch a string and apply a filter. Observe it would filter the content returned by the search query.  \n\n- if I run a search query while a filter is applied, the filter is overridden by the results of the search query. \nApply a filter and search a string. Observe that the previous filtered result is overridden by the search. ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "variables:_Filter_the_content_of_the_bitbake_variables_table"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.View_and_navigate_the_full_directory_structure_of_built_images",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".  \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build, and select the \"core-image-minimal\" link in the left sidebar.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe image information page has 2 tabs: \n- Packages included: this tab shows a table with all the packages installed in the image. The tab label includes the total number of packages listed in the table and their size. \n- Directory structure: this tab shows all the files included in the image.  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "By default, the included packages table displays the following columns in this order: \nPackage, Package version, Size, Dependencies  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Apart from the columns shown by default, the following additional columns are also available to users via the \"Edit columns\" menu: \nLayer, Layer branch, Layer commit, License, Recipe, Recipe version.  \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "The minimum table is made of the 2 columns that provide the information needed to identify a package: Package and Package version.  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "By default, the directory structure table shows the top level directories and files in the file system.\nThe table includes the following columns: \nDirectory/File, Symbolic link to, Source package, Size, Permissions, Owner, Group \nOpen some directories and see files. ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "View_and_navigate_the_full_directory_structure_of_built_images"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.View_a_summary_of_all_the_information_available_for_a_build",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and build \"bitbake core-image-minimal\".  \n \n",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select the build.  \n\n",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "A 'Build dashboard' page is showed. \nThe 'Build dashboard' page has two main states: \n(1) Success state: when the build completes successfully. In the success state, if the build target(s) include an image recipe, the page displays an image content module, and the left navigation has an \"Images\" section at the top. \n(2) Fail state: when the build fails (shown in this page). In the fail state, the page always displays an errors content module, and the left navigation does not have an \"Images\" section at the top.  \n\n",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Observe that the page provides access to all information available for the selected build. \n(1) Images \n(2) Build: this group provides links to the following pages: \nConfiguration, Tasks, Recipes, Packages \n(3) Performance: this group provides links to the following pages: \nTime, CPU usage, Disk I/O  \n\n",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "The page heading is made of the build target(s) and the machine, such as \"core-image-minimal qemux86\". If the build has more than one target, they show in ascending alphabetical order (A to Z) both in the page heading and in the \"Images\" section of the left navigation. If the build was successful, there is an image content module for each target that is an image recipe. The modules also show in ascending alphabetical order by target name. \n\n",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "Packages included, total package size, license manifest, image files are included in the images section.  \n\n",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "The information of Machine, Distro, Layers is included in configuration content module of \"Build summary\" section. \nThe information of \"Total number of task\", \"Tasks executed\", \" Tasks not executed\", \"Reuse\" is included in the tasks content module. \nThe information of \"Recipes built\" and \"Packages built\" is included in the \"Recipes&Packages\" content module. ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "View_a_summary_of_all_the_information_available_for_a_build"
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Display_the_content_of_error_messages_and_warnings",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and create a successful build and a failed build. You can force a build to terminate by ctrl+c. ",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Observe that the number of errors and warnings thrown by a build shows in both 'All builds' page and the 'Latest builds' section. ",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe that the number and content of errors and warnings thrown by a build shows in the 'Build dashboard' page. ",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Click warning or error links to see warning and error details.  ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "Display_the_content_of_error_messages_and_warnings."
+    }
+  },
+  {
+    "test": {
+      "@alias": "toaster.toaster.Build_summary_information_fully_implemented",
+      "author": [
+        {
+          "email": "Yuan.Sun2@windriver.com",
+          "name": "Yuan.Sun2@windriver.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Start with a default Yocto project (qemux86), start the Toaster, and create 4 builds. \na) a successful build with images (bitbake core-image-minimal) \nb) a successful build without images (bitbake mtools-native) \nc) a failed build with errors and warnings (run \"bitbake core-image-sato\", then press control+c to terminate the build)",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "In Toaster, select a core-image-minimal build.",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "Observe that there is a 'Build dashboard' page captured by Toaster. The page does not exist for builds in progress, only for finished builds. \nThe 'Build dashboard' page is made of: \na) Breadcrumb \nb) Navigation \n    IMAGES: core-image-minimal \n    BUILD: \n        Configuration \n        Tasks \n        Recipes \n        Packages \n    PERFORMANCE: \n        Time \n        CPU usage \n        Disk I/O \nc) Page heading (core-image-minimal qemux86) \nd) Section heading (Images, Build summary) \ne) Build status notification (Completed on xx/xx/xx... Build time:xx:xx:xx)",
+          "expected_results": ""
+        },
+        "4": {
+          "action": "Observe \"images\" section is made of the following \n.\na) Heading: core-image-minimal, which links to the \"Packages included\" tab of the image information page \nb) Number of packages installed: (packages included xx), which is a link to the \"Packages included\" tab of the image information page \nc) Total installed package size: xxMB \nd) License manifest (which is a link to the \"Packages included\" tab of the information page with the following columns showing: \"Package\", \"Package version\", \"License\" and \"Recipe\". We have bug 6079 open for this). Next to the license manifest is the path to the directory where you can find the license manifest file.  \n \ne) Image files (rootfs file names and rootfs file sizes)",
+          "expected_results": ""
+        },
+        "5": {
+          "action": "Observe \"Build summary\" section is made of the following. \na) Configuration (which is a link to the configuration page): \n    Machine \n    Distro \n    Layers (sorted in alphabetical order) \nb) Tasks (which is a link to the tasks page) \n    Total number of tasks (which is a link to the tasks page) \n    Tasks executed (which is a link to the tasks page with the tasks executed filter applied) \n    Tasks not executed (which is a link to the tasks pages with the tasks not executed filter applied)\n    Reuse \nc) Note that \"Total number of tasks\" should equal number of \"Tasks executed\" +  number of \"Tasks not executed\" \nd) Recipes (which is a link to the recipes page) & Packages (which is a link to the packages built page) ",
+          "expected_results": ""
+        },
+        "6": {
+          "action": "  Number of recipes built (which is a link to the recipes page)  \n \n    Number of packages built (which is a link to the packages built page)",
+          "expected_results": ""
+        },
+        "7": {
+          "action": "Return to localhost:8000 and select a successful build without images (mtools-native) \n.\nObserve the build dashboard for a successful build of a target that is not an image recipe. There is no image content module, and no \"Images\" section in the left navigation.",
+          "expected_results": ""
+        },
+        "8": {
+          "action": "Return to localhost:8000 and select the failed build (core-image-sato). Observe the build dashboard for the failed build.  \n \na) the errors content module: \nThis module exists for those builds that throw error(s). It appears immediately below the build status notification. \nThe module has 2 states: \n▪ Expanded (shows number of errors and error content) \n▪ Collapsed (shows only the number of errors) \nBy default, the errors module is in the expanded state. \nErrors content modules include the following information: \n(1.1) A heading, which indicates the number of errors thrown by the build, and toggles the module between its 2 states on click. ",
+          "expected_results": "NA"
+        },
+        "9": {
+          "action": "Transitions between states should use a slide up / slide down animation. \n(1.2) Error(s) content  \n\nb) the warning content module: \nThis module exists for those builds that throw warning(s). \nIt is the last content module shown on the build dashboard. \nThe module has 2 states: \n▪ Expanded (shows number of warnings and warning content) \n▪ Collapsed (shows only the number of warnings) \nBy default, the warning module is in the collapsed state. Warnings content modules include the following information: \n(2.1) A heading, which indicates the number of warnings thrown by the build, and toggles the module between its 2 \nstates on click. Transitions between states should use a slide up / slide down animation. \n(2.2) Warning(s) content ",
+          "expected_results": "NA"
+        }
+      },
+      "summary": "Build_summary_information_fully_implemented"
+    }
+  }
+]
\ No newline at end of file
-- 
2.7.4


