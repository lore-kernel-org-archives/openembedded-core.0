Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D128C7D919
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w10so2900047wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+KuP+rXWIV3+C7YfLinWVcVhHtGVWY5KbAZdtmgDWWA=;
	b=Hb/BID38txI1NIpN1deJrQ98NO9ZsDCgXpGqOqT0gkXRhq8wRQAsWl3oJ/BOSphQJf
	GlevLuDEXDMMPgAH3MoolJZBKKlj0rKG5kziXzuak+dOjkfi7WDhkGEaXP+q3YBO5p2s
	cdjJwHpWv41bSJWQ7v8Mem0+kuR/bxAD0iNB4EYEEj/uGwhTaayJ/BcCVIZkhpYzhXDL
	WM71Ym3sJ75LCw3s9jbVrWDjoTRrfAKMfrRIW4ONa/D5fOdOPowrg0zV1SNa0MtD9pRL
	ypHuhDybv2I/QzwFG7zJjO95O0M3XfbZeMXTapPrppwWHd4WxyHSCd83Jf0flYYXy/kg
	3AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+KuP+rXWIV3+C7YfLinWVcVhHtGVWY5KbAZdtmgDWWA=;
	b=cFU5a0lTsk7nfkldT5iLl7ZCLnZ2Sr8fhE2etX0Czek8WwzwsED1sQUdKyQWNlCXkv
	2ZnFwHefEExXXSg9XSCxky8hi2Bph0pB8rD9t4X8UfGgeRqsxH3rYMSfXslNG0CG6idB
	m7Be/O+7kuEqocc+LkBmhswvEdrnrUJpb1/jh9U7L/UAKonQv1Fx1++dWs1Zl4C+nQRM
	tAtovgi996d8IPwTjtQtWSLfEpVx4LqkSzzY9gGbzpgjDD247ACzarXTeouyIsk77J01
	0WtDKYK4+AIm70fQ/78n1MwRh5etGH1pI8PyodjlRdhNNKTqNWju64k7YrLRrr25zOWu
	62ag==
X-Gm-Message-State: APjAAAWZImR9/GU0b07h6o8kDNuR/Jo0uT+MzUu5oZ8CaHSOCpJs8FU1
	ZW+1MvP6btvc+mjlcEs6/u4PJHko+Uo=
X-Google-Smtp-Source: APXvYqx+xe1r/STyIfhYLALVEO4Q+Un5uJJgrTOZpAK/fW/BlDIr6KTxBsnYDHCMytEL+N5kU1NrJA==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr28189069wru.161.1554901933220; 
	Wed, 10 Apr 2019 06:12:13 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:29 +0530
Message-Id: <35233e411db1a5978bfb2f4265b8e3a8fbdc4246.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 10/33] oeqa/manual/kernel-dev.json: test id updated
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:13 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


