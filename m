Return-Path: <sangeeta.jain@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 632616D4E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 05:02:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2019 22:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,477,1544515200"; d="scan'208";a="152192442"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2019 22:02:36 -0700
From: sangeeta.jain@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 12:31:17 +0800
Message-Id: <1552537877-28856-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/manual/compliance-test.json: test id updated and missing test cases added
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
X-List-Received-Date: Thu, 14 Mar 2019 05:02:36 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Two changes made in oeqa/manual/compliance-test.json:

1. All test id (eg. @alias) inside manual testcase file shall follow the same test id
naming convention from oeqa automated tests (eg. selftest, runtime, sdk, etc), where
the test id consists of  <test_module>.<test_suite>.<test_function>. Furthermore,
there shall be only 1 unique test_module per each manual testcases file.

This file was using more than 1 unique test_module for testcases. Furthermore, some of
the testcases were defined using different test_suite where it was not needed. This patch
fix the manual testcases file to have only 1 unique test_module as well as test_suite to
simplify test id naming.

2. Added 2 missing test cases for Beaglebone Stress Test.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 meta/lib/oeqa/manual/compliance-test.json | 60 ++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
index 7adf8a1..982f0b4 100644
--- a/meta/lib/oeqa/manual/compliance-test.json
+++ b/meta/lib/oeqa/manual/compliance-test.json
@@ -1,7 +1,7 @@
 [
     {
         "test": {
-            "@alias": "configuration.configuration.LTP_subset_test_suite",
+            "@alias": "compliance-test.compliance-test.LTP_subset_test_suite",
             "author": [
                 {
                     "email": "corneliux.stoicescu@intel.com",
@@ -43,7 +43,7 @@
     },
     {
         "test": {
-            "@alias": "configuration.configuration.POSIX_subset_test_suite",
+            "@alias": "compliance-test.compliance-test.POSIX_subset_test_suite",
             "author": [
                 {
                     "email": "corneliux.stoicescu@intel.com",
@@ -89,7 +89,7 @@
     },
     {
         "test": {
-            "@alias": "configuration.configuration.LSB_subset_test_suite",
+            "@alias": "compliance-test.compliance-test.LSB_subset_test_suite",
             "author": [
                 {
                     "email": "corneliux.stoicescu@intel.com",
@@ -119,7 +119,7 @@
     },
     {
         "test": {
-            "@alias": "General_Runtime.General_Runtime.stress_test_-_Genericx86-64",
+            "@alias": "compliance-test.compliance-test.stress_test_-_Genericx86-64",
             "author": [
                 {
                     "email": "corneliux.stoicescu@intel.com",
@@ -138,5 +138,57 @@
             },
             "summary": "stress_test_-_Genericx86-64"
         }
+    },
+     {
+    "test": {
+      "@alias": "compliance-test.compliance-test.stress_test_-_- crashme_-_-Beaglebone",
+      "author": [
+        {
+          "email": "corneliux.stoicescu@intel.com",
+          "name": "corneliux.stoicescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": " Get crashme from http://people.delphiforums.com/gjc/crashme.html",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Follow the setup steps on above URL, build crashme in target",
+          "expected_results": ""
+        },
+        "3": {
+          "action": " Run crashme for 24 hours",
+          "expected_results": "Target should not crash with the program."
+        }
+      },
+      "summary": "stress_test_-_crashme_-Beaglebone"
+    }
+  },
+  {
+    "test": {
+      "@alias": "compliance-test.compliance-test.stress_test_-_ltp_-Beaglebone",
+      "author": [
+        {
+          "email": "corneliux.stoicescu@intel.com",
+          "name": "corneliux.stoicescu@intel.com"
+        }
+      ],
+      "execution": {
+        "1": {
+          "action": "Build LTP with toolchain or in sdk image",
+          "expected_results": ""
+        },
+        "2": {
+          "action": "Copy LTP folder into target, for example, /opt/ltp. Modify script,  testscripts/ltpstress.sh, set Iostat=1, NO_NETWORK=1",
+          "expected_results": ""
+        },
+        "3": {
+          "action": "cd testscripts/ && ./ltpstress.sh",
+          "expected_results": "This stress case will run for 24 hours Check the result\ntarget should not crash with the program "
+        }
+      },
+      "summary": "stress_test_-_-ltp_-Beaglebone"
     }
+  }
 ]
\ No newline at end of file
-- 
2.7.4


