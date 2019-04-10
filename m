Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADE357D917
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c1so2549382wml.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O95vDUDoSN3dbi1dMPHhKZuo6m91FJ5MavArF6t4IXQ=;
	b=h5dY7+eKBU8r0kj3wd52cuTqOhmONfSYARemQVVWIWuwzkOg8IsHlib/O8EgS2gafU
	q60qMMfGC+91WBwkTjFp84Vgdu76ZlO7/+zMtDYR9dIWg4dx8vYOS3WZjhYXXSsOwc2O
	wRZv8QQtZNOphy6ZWQ+Ch/DBJ3zKUDa0tSjwK4wxE/O1ua2jHsFQv9Skq5D6DLX4Xj6Z
	b7S0xc6Cjn9rRBPsL8pb+Ndno7XlytEORAGPhNERQxU63HLzi4a14r1ViuTFwGCzNqPO
	VHv6qlmaZKMAzP4YfcRGRiCwB2UmKrOVre7wmyL3cA3P3kYK/oKYs+XItnarsTi3SnFh
	rqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O95vDUDoSN3dbi1dMPHhKZuo6m91FJ5MavArF6t4IXQ=;
	b=s6eiQ91iLnPD/AeE3D4mpLBB7f2lzphVmIpJ+vzGr4fXsQOmLcmM5wyXzV8RWm0nHg
	/L+5nJRF/7R5k7O2H/sp6PottTu72y+1uvl91I0V00enIpFCrY31Su1QD+eb3/D0hAFr
	9QDO9W9v1X7LQeS6wx8cCuzQE2rzz3SjlqwS0p9fGH0fygn/cTkRxVmXAwRm9jKoXXKJ
	k239ZJUprgBkq2K+CIyyscHvotVnawN1Q0YqmIfWmGJ/gNdTgp4tVI/ugX3i12ybXyZh
	16l/oAMdFUEK6ZjW/JJ8TVwyala6vR9PMJDT56u6YNN7pJUJ+U3olLxq+Zc2B40rplh8
	H74Q==
X-Gm-Message-State: APjAAAWGjDwbyY2Ds97qrN7CLzYla0lzBy7a7mzVzWi06p2l2uc2BEng
	eJFDjjE0RjlQntUJr4ip3vIlJc3+X9c=
X-Google-Smtp-Source: APXvYqzU9MLo0IDPCjeHwLqZSw97Hz1x3Yt7GaaiU1TEd0NrFo++3m/r/ntSdXfglUwRb9eXI0uxNg==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr2882368wmj.121.1554901932032; 
	Wed, 10 Apr 2019 06:12:12 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:28 +0530
Message-Id: <7d95d4c6d30ae2977cd9feb5a45f96d05ff9b763.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 09/33] oeqa/manual/compliance-test.json: test id updated and missing test cases added
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:11 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


