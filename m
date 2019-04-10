Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id CC0C07D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y7so2860915wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=dIP7NLgncGUNdBL2ELj34/0oPHnoVK0LKB3RT0dOoos=;
	b=I3vJFBEjphXN+t4zjktswAeRdLQYBuXw8aamwaU8RqmXSuHr9IfMXeKmL5ZLowK5Ue
	71eY9drio7aslUZG4W5xDRrxdSD/ULx+05/hvvLHEJ74Z+nLKkBiFedqHoPs/I/JxvkD
	QydBjuYHWim2P5s88FDCIxQ/6SemVgesginb5foSE9+DS55Z+MGDKmeDMqUEG4JaUBAS
	MHxONIYquMy8KZmDVAqeo/nSzc7bMo45cmNr7EuV35My7Z2geb8mi+hWPesfl+4+3AFD
	PnQ9xT274+e7w7bFsd/B+XbdQngcnsFzZQ+4ubgALDPHbtrfMZCIBCY95UV/DPPUaNdm
	+Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=dIP7NLgncGUNdBL2ELj34/0oPHnoVK0LKB3RT0dOoos=;
	b=Ezpj6yZphqTPLxqypuZ/mawYos8QrrJalkIRawl+zBYpVFEbTCqsPbJKa2j7OfhW5l
	N0HeBzE6w8aesycnySTcTFZRGa73DeLTU6M3re9Okey3dmJv/KpekZ1CwBvnO9RcSL4k
	tndD3yy8wh5TvbPnbtmhNTGWerfWbWQFbz8S9Kxr8aw5lcc+zL1lPZFGxtuj6O18SXfa
	gH0ZG9OrmXmfP1PDTEa563b9NSotcBDkDitKVgYKvwSdy4u6Hi+0M6xMfN5wctIZdvnE
	6cv/rNSOUU0wcGobYi8Na3p4ALb5p70MYcZcmASA9MblnPQil3wUK7MxNdJ1jRM7m7iJ
	b4oQ==
X-Gm-Message-State: APjAAAUfl43TcNNs/GsEBOVSP4/gU8X8fGhuxrA8mLPJIPcTbrDT1d1+
	Ht71oq7wlakzebPpMMUaiQd/SoT5bvg=
X-Google-Smtp-Source: APXvYqwDc8yODYijamx5Gi+Srl9DvXD8WZ/4V3WYdU+B1CMieGfnBEuKYXtka9LXcodHYE27Z2GEug==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr5985398wrq.87.1554901939007; 
	Wed, 10 Apr 2019 06:12:19 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:31 +0530
Message-Id: <05e08a64771e40c147bdd6f02492b85edc01e946.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 12/33] oeqa/manual/toaster: updated test id naming
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

All test id (eg. @alias) inside manual testcase file shall follow the same
test id naming convention from oeqa automated tests (eg. selftest,
runtime, sdk, etc), where the test id consists of
<test_module>.<test_suite>.<test_function>. Furthermore, there shall be
only 1 unique test_module per each manual testcases file, where
test_module match the file name itself.

This file was using test_module name that does not match the file name
itself. Fixed test_module name as well as the test_suite name.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json   | 130 +++++++++++------------
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json |  56 +++++-----
 2 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
index ba0658f..812f57d 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -1,7 +1,7 @@
 [
   {
     "test": {
-      "@alias": "toaster.toaster.All_layers:_default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.All_layers:_default_view",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -47,7 +47,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.All_layers:_Add/delete_layers",
+      "@alias": "toaster-managed-mode.toaster-managed.All_layers:_Add/delete_layers",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -85,7 +85,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.All_targets:_Default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.All_targets:_Default_view",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -119,7 +119,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Configuration_variables:_default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.Configuration_variables:_default_view",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -153,7 +153,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Configuration_variables:_Test_UI_elements",
+      "@alias": "toaster-managed-mode.toaster-managed.Configuration_variables:_Test_UI_elements",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -215,7 +215,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Project_builds:_Default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.Project_builds:_Default_view",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -249,7 +249,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Project_builds:_Sorting_the_project_builds_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Project_builds:_Sorting_the_project_builds_table",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -287,7 +287,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Project_builds:_customize_the_columns_of_the_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Project_builds:_customize_the_columns_of_the_table",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -321,7 +321,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Project_builds:_filter_the_contents_of_the_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Project_builds:_filter_the_contents_of_the_table",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -355,7 +355,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Project_builds:_search_the_contents_of_the_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Project_builds:_search_the_contents_of_the_table",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -393,7 +393,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Layer_details_page:_Default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.Layer_details_page:_Default_view",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -471,7 +471,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Layer_details_page:_UI_functionality",
+      "@alias": "toaster-managed-mode.toaster-managed.Layer_details_page:_UI_functionality",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -517,7 +517,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Importing_new_layers",
+      "@alias": "toaster-managed-mode.toaster-managed.Importing_new_layers",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -547,7 +547,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Layer_details_page:_UI_functionality_for_imported_layers",
+      "@alias": "toaster-managed-mode.toaster-managed.Layer_details_page:_UI_functionality_for_imported_layers",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -601,7 +601,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Multiple_build_directories",
+      "@alias": "toaster-managed-mode.toaster-managed.Multiple_build_directories",
       "author": [
         {
           "email": "stanciux.mihail@intel.com",
@@ -647,7 +647,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Run_again_button_from_all_builds_page_must_run_the_specified_task",
+      "@alias": "toaster-managed-mode.toaster-managed.Run_again_button_from_all_builds_page_must_run_the_specified_task",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -693,7 +693,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Intel_layers_builds",
+      "@alias": "toaster-managed-mode.toaster-managed.Intel_layers_builds",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -743,7 +743,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Download_other_artifacts",
+      "@alias": "toaster-managed-mode.toaster-managed.Download_other_artifacts",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -785,7 +785,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Download_licence_manifest",
+      "@alias": "toaster-managed-mode.toaster-managed.Download_licence_manifest",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -827,7 +827,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_dependencies_layers",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_dependencies_layers",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -873,7 +873,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_build_recipe_button_from_recipes_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_build_recipe_button_from_recipes_page",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -915,7 +915,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_compatible_machines",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_compatible_machines",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -961,7 +961,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Builds_with_different_machines",
+      "@alias": "toaster-managed-mode.toaster-managed.Builds_with_different_machines",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1007,7 +1007,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_bitbake_variables_-_IMAGE_FSTYPES",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_bitbake_variables_-_IMAGE_FSTYPES",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1049,7 +1049,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Software_recipes:_default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.Software_recipes:_default_view",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1083,7 +1083,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Software_recipes:_sorting_the_content_of_the_software_recipes_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Software_recipes:_sorting_the_content_of_the_software_recipes_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1129,7 +1129,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Software_recipes:_Searching_the_content_of_the_software_recipes_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Software_recipes:_Searching_the_content_of_the_software_recipes_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1179,7 +1179,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Software_recipes:_Filter_the_contents_of_the_software_recipes_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Software_recipes:_Filter_the_contents_of_the_software_recipes_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1213,7 +1213,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_the_packages_included_in_the_image",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_the_packages_included_in_the_image",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1259,7 +1259,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_the_filters_from_a_image_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_the_filters_from_a_image_page",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1301,7 +1301,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_dependencies_link",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_dependencies_link",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1351,7 +1351,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_recipe_file_link",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_recipe_file_link",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1393,7 +1393,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.See_packages_size",
+      "@alias": "toaster-managed-mode.toaster-managed.See_packages_size",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1435,7 +1435,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Build_multiple_recipes",
+      "@alias": "toaster-managed-mode.toaster-managed.Build_multiple_recipes",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1465,7 +1465,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Build_a_recipe_with_different_distro",
+      "@alias": "toaster-managed-mode.toaster-managed.Build_a_recipe_with_different_distro",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1511,7 +1511,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_package_format_-_ipk_rpm_deb",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_package_format_-_ipk_rpm_deb",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1549,7 +1549,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Test_IMAGE_INSTALL_append_variable",
+      "@alias": "toaster-managed-mode.toaster-managed.Test_IMAGE_INSTALL_append_variable",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1595,7 +1595,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.New_custom_image:_default_view",
+      "@alias": "toaster-managed-mode.toaster-managed.New_custom_image:_default_view",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1637,7 +1637,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.New_custom_image:_sorting_the_content_of_new_custom_image_table",
+      "@alias": "toaster-managed-mode.toaster-managed.New_custom_image:_sorting_the_content_of_new_custom_image_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1687,7 +1687,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.New_custom_image:_searching_the_content_of_new_custom_image_table",
+      "@alias": "toaster-managed-mode.toaster-managed.New_custom_image:_searching_the_content_of_new_custom_image_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1733,7 +1733,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.New_custom_image:_Filter_the_contents_of_the_new_custom_image_table",
+      "@alias": "toaster-managed-mode.toaster-managed.New_custom_image:_Filter_the_contents_of_the_new_custom_image_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1767,7 +1767,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Create_new_custom_image",
+      "@alias": "toaster-managed-mode.toaster-managed.Create_new_custom_image",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1805,7 +1805,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Custom_image_page_details",
+      "@alias": "toaster-managed-mode.toaster-managed.Custom_image_page_details",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1839,7 +1839,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Custom_image_page_–_Add_|_Remove_packages_table",
+      "@alias": "toaster-managed-mode.toaster-managed.Custom_image_page_–_Add_|_Remove_packages_table",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
@@ -1901,7 +1901,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Adding_packages_without_dependencies_from_custom_images",
+      "@alias": "toaster-managed-mode.toaster-managed.Adding_packages_without_dependencies_from_custom_images",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -1935,7 +1935,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Removing_packages_without_and_with_dependencies__from_custom_images",
+      "@alias": "toaster-managed-mode.toaster-managed.Removing_packages_without_and_with_dependencies__from_custom_images",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -1969,7 +1969,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Adding_packages_with_dependencies",
+      "@alias": "toaster-managed-mode.toaster-managed.Adding_packages_with_dependencies",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2003,7 +2003,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Create_Project",
+      "@alias": "toaster-managed-mode.toaster-managed.Create_Project",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2029,7 +2029,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_project_detail_page_left_bar_menu",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_project_detail_page_left_bar_menu",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2059,7 +2059,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Configuration_information_of_Project_Detail_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Configuration_information_of_Project_Detail_page",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2089,7 +2089,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_Machine_information_of_project_detail_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_Machine_information_of_project_detail_page",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2115,7 +2115,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_most_built_recipes_information_of_the_project_detail_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_most_built_recipes_information_of_the_project_detail_page",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2141,7 +2141,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_project_release_information_on_project_detail_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_project_release_information_on_project_detail_page",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2167,7 +2167,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_layer_information_of_the_project_detail_page",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_layer_information_of_the_project_detail_page",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2197,7 +2197,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_project_detail_links",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_project_detail_links",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2223,7 +2223,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_build_texbox_exists_and_works",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_build_texbox_exists_and_works",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2253,7 +2253,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Veryfing_the_builds_link_show_proper_information",
+      "@alias": "toaster-managed-mode.toaster-managed.Veryfing_the_builds_link_show_proper_information",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2279,7 +2279,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_that_the_Import_layer_link_shows_the_form",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_that_the_Import_layer_link_shows_the_form",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2305,7 +2305,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_that_New_Custom_Image_link_works_and_shows_information",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_that_New_Custom_Image_link_works_and_shows_information",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2331,7 +2331,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_most_built_recipe_shows_a_maximum_of_5_recipes",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_most_built_recipe_shows_a_maximum_of_5_recipes",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2365,7 +2365,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_order_sequence_of_listing_in_Most_build_recipes",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_order_sequence_of_listing_in_Most_build_recipes",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2403,7 +2403,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_Most_build_recipes_multiple_selection",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_Most_build_recipes_multiple_selection",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2449,7 +2449,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_layer_addition_functionality",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_layer_addition_functionality",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2487,7 +2487,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Verify_delete_layer_functionality",
+      "@alias": "toaster-managed-mode.toaster-managed.Verify_delete_layer_functionality",
       "author": [
         {
           "email": "libertad.gonzalez.de.la.cruz@intel.com",
@@ -2521,7 +2521,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Download_task_log",
+      "@alias": "toaster-managed-mode.toaster-managed.Download_task_log",
       "author": [
         {
           "email": "alexandru.costinx.roman@intel.com",
diff --git a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
index e614b14..29d11a8 100644
--- a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
+++ b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
@@ -1,7 +1,7 @@
 [
   {
     "test": {
-      "@alias": "toaster.toaster.Create_a_Yocto_project_and_start_the_Toaster",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Create_a_Yocto_project_and_start_the_Toaster",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -31,7 +31,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Sort_the_content_of_the_builds_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Sort_the_content_of_the_builds_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -69,7 +69,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Search_the_content_of_the_builds_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Search_the_content_of_the_builds_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -107,7 +107,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Filter_the_content_of_the_builds_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Filter_the_content_of_the_builds_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -149,7 +149,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Tasks_in_toaster_UI",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Tasks_in_toaster_UI",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -231,7 +231,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.package_detail_in_toaster_UI",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.package_detail_in_toaster_UI",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -285,7 +285,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.recipes:_Sort_the_content_of_the_recipes_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.recipes:_Sort_the_content_of_the_recipes_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -327,7 +327,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.recipes:_Search_the_content_of_the_recipes_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.recipes:_Search_the_content_of_the_recipes_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -385,7 +385,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.recipes:_Customise_the_columns_of_the_recipes_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.recipes:_Customise_the_columns_of_the_recipes_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -411,7 +411,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.recipes:_View_a_table_with_all_the_recipes_included_in_an_image_recipe",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.recipes:_View_a_table_with_all_the_recipes_included_in_an_image_recipe",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -441,7 +441,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.recipes:_View_detailed_information_about_a_recipe。",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.recipes:_View_detailed_information_about_a_recipe。",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -495,7 +495,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.variables:_Search_the_content_of_the_bitbake_variables_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.variables:_Search_the_content_of_the_bitbake_variables_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -545,7 +545,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.variables:_Sort_the_content_of_the_bitbake_variables_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.variables:_Sort_the_content_of_the_bitbake_variables_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -579,7 +579,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.builds:_View_a_table_of_all_the_builds_run_for_a_certain_build_directory",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.builds:_View_a_table_of_all_the_builds_run_for_a_certain_build_directory",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -605,7 +605,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.builds:_Customise_the_columns_of_the_builds_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.builds:_Customise_the_columns_of_the_builds_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -635,7 +635,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.packages:_View_a_table_with_all_the_packages_built_for_an_image_recipe",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.packages:_View_a_table_with_all_the_packages_built_for_an_image_recipe",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -673,7 +673,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.packages:_Sort_the_content_of_the_packages_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.packages:_Sort_the_content_of_the_packages_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -735,7 +735,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.packages:_Customise_the_columns_of_the_packages_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.packages:_Customise_the_columns_of_the_packages_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -769,7 +769,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.packages:_Search_the_content_of_the_packages_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.packages:_Search_the_content_of_the_packages_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -823,7 +823,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.View_detailed_information_about_a_layer",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.View_detailed_information_about_a_layer",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -853,7 +853,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Select_the_number_of_table_rows_displayed_per_page",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Select_the_number_of_table_rows_displayed_per_page",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -891,7 +891,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.View_detailed_configuration_information_for_a_build",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.View_detailed_configuration_information_for_a_build",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -945,7 +945,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.variables:_Customise_the_columns_of_the_bitbake_variables_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.variables:_Customise_the_columns_of_the_bitbake_variables_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -971,7 +971,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.variables:_Filter_the_content_of_the_bitbake_variables_table",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.variables:_Filter_the_content_of_the_bitbake_variables_table",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -1005,7 +1005,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.View_and_navigate_the_full_directory_structure_of_built_images",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.View_and_navigate_the_full_directory_structure_of_built_images",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -1047,7 +1047,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.View_a_summary_of_all_the_information_available_for_a_build",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.View_a_summary_of_all_the_information_available_for_a_build",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -1089,7 +1089,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Display_the_content_of_error_messages_and_warnings",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Display_the_content_of_error_messages_and_warnings",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
@@ -1119,7 +1119,7 @@
   },
   {
     "test": {
-      "@alias": "toaster.toaster.Build_summary_information_fully_implemented",
+      "@alias": "toaster-unmanaged-mode.toaster-unmanaged.Build_summary_information_fully_implemented",
       "author": [
         {
           "email": "Yuan.Sun2@windriver.com",
-- 
2.7.4


