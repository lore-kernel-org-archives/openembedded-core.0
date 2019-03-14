Return-Path: <sangeeta.jain@intel.com>
X-Greylist: delayed 570 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Mar 2019 05:54:59 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id D6BB46C1CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 05:54:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2019 22:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,477,1544515200"; d="scan'208";a="152201478"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2019 22:45:29 -0700
From: sangeeta.jain@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 13:14:18 +0800
Message-Id: <1552540458-37928-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/manual/kernel-dev.json: test id updated
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
X-List-Received-Date: Thu, 14 Mar 2019 05:55:00 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

All test id (eg. @alias) inside manual testcase file shall follow the same test id
naming convention from oeqa automated tests (eg. selftest, runtime, sdk, etc), where
the test id consists of  <test_module>.<test_suite>.<test_function>. Furthermore,
there shall be only 1 unique test_module per each manual testcases file.

This file was using more than 1 unique test_module for testcases. Furthermore,
some of the testcases were defined using different test_suite where it was not needed.
This patch fix the manual testcases file to have only 1 unique test_module
as well as test_suite to simplify test id naming.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 meta/lib/oeqa/manual/kernel-dev.json | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/manual/kernel-dev.json b/meta/lib/oeqa/manual/kernel-dev.json
index c93b4dd..0dd9919 100644
--- a/meta/lib/oeqa/manual/kernel-dev.json
+++ b/meta/lib/oeqa/manual/kernel-dev.json
@@ -1,7 +1,7 @@
 [
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_defconfig",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_defconfig",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -18,12 +18,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_7"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_defconfig"
+            "summary": "Kernel_dev_defconfig"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_defconfig+fragments",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_defconfig+fragments",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -40,12 +40,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_8"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_defconfig+fragments"
+            "summary": "Kernel_dev_defconfig+fragments"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_Applying_patches",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_Applying_patches",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -62,12 +62,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_Applying_patches"
+            "summary": "Kernel_dev_Applying_patches"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-local-source",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_linux-yocto-local-source",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -84,12 +84,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_2"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-local-source"
+            "summary": "Kernel_dev_linux-yocto-local-source"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-custom-local-source",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_linux-yocto-custom-local-source",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -106,12 +106,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_3"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_linux-yocto-custom-local-source"
+            "summary": "Kernel_dev_linux-yocto-custom-local-source"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_recipe-space_meta",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_recipe-space_meta",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -128,12 +128,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_5"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_recipe-space_meta"
+            "summary": "Kernel_dev_recipe-space_meta"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_External_source",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_External_source",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -150,12 +150,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_6"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_External_source"
+            "summary": "Kernel_dev_External_source"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_building_external_modules(hello-mod)",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_building_external_modules(hello-mod)",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -172,12 +172,12 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_10"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_building_external_modules(hello-mod)"
+            "summary": "Kernel_dev_building_external_modules(hello-mod)"
         }
     },
     {
         "test": {
-            "@alias": "kernel-configuration.kernel-configuration.TCTEMP_2.3_MANUAL_Kernel_dev_local_parallel_meta",
+            "@alias": "kernel-dev.kernel-dev.Kernel_dev_local_parallel_meta",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -194,7 +194,7 @@
                     "expected_results": "Review expected results on thethe \"Kernel Development Test Cases\"wiki. https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases#Expected_Results_4"
                 }
             },
-            "summary": "TCTEMP_2.3_MANUAL_Kernel_dev_local_parallel_meta"
+            "summary": "Kernel_dev_local_parallel_meta"
         }
     }
 ]
\ No newline at end of file
-- 
2.7.4


