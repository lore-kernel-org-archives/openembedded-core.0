Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66918CD3426
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2358.1762384577889138897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ORSQK/Ru;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e13yfS64;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564e8376-19a86f53-c338-4f47-a23e-227ae13dbee1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pVDSx0aO1RND5qDWsP6OixD0WKUl9g3Y+iCAcYsNCB4=;
	b=ORSQK/RuSgvjsnmuT/nDp3z9H9p0OSOSw/CXpkZNRV++lQO6FLVy+HMp0DCQSrYY
	NMxz9qPELSCVMgsKBOd6R6QzAf1RUAHtB2QCNo4E1z9ealNg+pYukdAE7i5zOvfbNyU
	v50MwRK7fcVO6+iWyNEHo8qVpqMBRcSCshhxbwTk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pVDSx0aO1RND5qDWsP6OixD0WKUl9g3Y+iCAcYsNCB4=;
	b=e13yfS6435wVBPQ2BYK1JZ94SBc6Pjq2w//LnhG/k5swtzAJ8fkd7x8FeaYX15bP
	qj8QCGPcrOWaaGmhKsqHei1KLGyiQYXTDCRZ42Co7uJRSAEd2Dm2t4kVUOIBRIej3EE
	fSYfha8LoY7xTTT73Aohkp9KGYKXh1AudbhT2Re4=
Content-Type: multipart/mixed; boundary="===============2130396022860119122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.15.1 FAILED
Message-ID: <0101019a564e8376-19a86f53-c338-4f47-a23e-227ae13dbee1-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225806

--===============2130396022860119122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxml2* to *2.15.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.14.6-2.15.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 209f46981304dc9ca51c3be009b12ac92c927d6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:16:39 +0000
Subject: [PATCH] libxml2: upgrade 2.14.6 -> 2.15.1

---
 ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch |  4 ++--
 meta/recipes-core/libxml/libxml2/install-tests.patch |  6 +++---
 .../libxml/{libxml2_2.14.6.bb => libxml2_2.15.1.bb}  |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.1.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 627f8472c3..11e6873ffb 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
+From fc037894bf49b0904e82088d20d782ddd0090a6b Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aaa02e3..fb241bb 100644
+index 4eb629b..150e06e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -37,7 +37,7 @@ index aaa02e3..fb241bb 100644
  AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
                     [System configuration directory (/etc)])
 diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
-index e040a75..dc0d6b8 100644
+index ff6433f..b775cfe 100644
 --- a/libxml2-config.cmake.in
 +++ b/libxml2-config.cmake.in
 @@ -24,17 +24,20 @@
@@ -66,10 +66,10 @@ index e040a75..dc0d6b8 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 98bc6e3..3ef0bd0 100644
+index 31c73b6..8728852 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -599,9 +599,6 @@ config_cmake = configuration_data()
+@@ -577,9 +577,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
index 0b73bceb24..61a69a4a8d 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -1,4 +1,4 @@
-From e546e423d69ec9b3c71167d3c3140fa1b9af93c7 Mon Sep 17 00:00:00 2001
+From 32d141339a14500935578287e528819a2ac0b5ef Mon Sep 17 00:00:00 2001
 From: Nick Wellnhofer <wellnhofer@aevum.de>
 Date: Tue, 27 May 2025 12:53:17 +0200
 Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
@@ -18,7 +18,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/tree.c b/tree.c
-index e14bc62..22ec11c 100644
+index e4fd0d6..e353c1f 100644
 --- a/tree.c
 +++ b/tree.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 4c1faa83cb..18f3a5b2af 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
+From fe0b632fcee3a272586449d43548ea0defbb8beb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 6f98144..ecb3b54 100644
+index 19ec305..9161af9 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
+@@ -29,6 +29,16 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.1.bb
index 6ed8760f4c..8ad700d515 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.47.1


--===============2130396022860119122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1947 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-67dbe2c94c5c81560d296901abdae9744c551cd9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:67dbe2c94c5c81560d296901abdae9744c551cd9"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 343 Local 293 Mirrors 0 Missed 50 Current 363 (85% match, 92% complete)
Removing 9 stale sstate objects for arch qemux86_64...done.
Removing 11 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 373 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 498 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_setscene)
NOTE: Running setscene task 610 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 636 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 647 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 659 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 665 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 672 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-native-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 699 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 937 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_fetch)
NOTE: Running task 940 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: Running task 980 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 1039 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 1045 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: Running task 1103 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_fetch)
NOTE: Running task 1114 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 1119 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: Running task 1123 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Running task 1129 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 1149 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_fetch: Started
NOTE: Running task 1259 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1279 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: Running task 1291 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_fetch: Started
NOTE: Running task 1317 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: Running task 1318 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: Running task 1319 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 1320 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: Running task 1326 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: Running task 1327 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: Running task 1328 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: Running task 1329 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe meson-native-1.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: Running task 1330 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: recipe libxml2-2.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1331 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_unpack)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: Running task 1333 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1334 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe meson-native-1.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe libxml2-native-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 1791 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: Running task 1792 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_patch)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 1794 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1796 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_patch)
NOTE: recipe libxml2-2.15.1-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe libxml2-native-2.15.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1798 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: Running setscene task 705 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1799 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1801 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1802 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_lic)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_lic: Started
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch unihash changed to 0546f4507be13d89537f5875ed2768e77624e6a9a75d37feae30328ad22f4339
NOTE: recipe libxml2-native-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch unihash changed to 72e7a4cde2d37d7d00e09962bd2846d69197a73e68e59dc3ac5230238c7cd001
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_lic unihash changed to abed9e644605de4b5a804a3c7d4b0b0e0e3a9b2ee6a372f858c82ee7f88f09cc
NOTE: Reported task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx as unihash 2d33096012cf2dad9b49244a772926e7a33d5ddde7057da2fbd924f1eaad726e to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ff8411581d3a405f7c44545480daa7ee448ef512f1c30c66e39c29a3fd90af79', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '2d33096012cf2dad9b49244a772926e7a33d5ddde7057da2fbd924f1eaad726e'})
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx unihash changed ff8411581d3a405f7c44545480daa7ee448ef512f1c30c66e39c29a3fd90af79 -> 2d33096012cf2dad9b49244a772926e7a33d5ddde7057da2fbd924f1eaad726e as wanted
NOTE: Already covered setscene for virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx as unihash edfcf94d07761d9752228d516c0e831b20f3de198e6b3b88c45a65909355d951 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'aa96d7552baa91b4e292278490c0599597efc61168f87e7e9ce5026acd12af3b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'edfcf94d07761d9752228d516c0e831b20f3de198e6b3b88c45a65909355d951'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx unihash changed aa96d7552baa91b4e292278490c0599597efc61168f87e7e9ce5026acd12af3b -> edfcf94d07761d9752228d516c0e831b20f3de198e6b3b88c45a65909355d951 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot as unihash 5b36fa4f7ddff1991765e90d9c0896fa623c7be40874b74a2549eb821a1fbaaa to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'e74b523fcf0dc6ffc2b5a698902a438e778bcc2fe25b03cae8ce35be20ebbfdb', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5b36fa4f7ddff1991765e90d9c0896fa623c7be40874b74a2549eb821a1fbaaa'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot unihash changed e74b523fcf0dc6ffc2b5a698902a438e778bcc2fe25b03cae8ce35be20ebbfdb -> 5b36fa4f7ddff1991765e90d9c0896fa623c7be40874b74a2549eb821a1fbaaa as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash b7c59e743e93e4671ddb5d13d51d43a369693a3879d492f54e133cef94b59c15 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f909d669639857ee93823595d9983d1e554f445f397c39c83a8dfb67a237ab77', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b7c59e743e93e4671ddb5d13d51d43a369693a3879d492f54e133cef94b59c15'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed f909d669639857ee93823595d9983d1e554f445f397c39c83a8dfb67a237ab77 -> b7c59e743e93e4671ddb5d13d51d43a369693a3879d492f54e133cef94b59c15 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 1821 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure)
NOTE: recipe libxml2-native-2.15.1-r0: task do_configure: Started
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 706 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1835 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1840 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1842 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure)
NOTE: recipe libxml2-2.15.1-r0: task do_configure: Started
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_configure: Failed
NOTE: recipe libxml2-2.15.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1843 tasks of which 1801 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105151612.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105151612.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libxml2-native/2.15.1/temp/log.do_configure.2527536
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxml2/2.15.1/temp/log.do_configure.2527947
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-native-2.15.1-r0 do_configure: QA Issue: libxml2-native: configure was passed unrecognised options: --without-lzma [unknown-configure-option]
ERROR: libxml2-native-2.15.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: libxml2-2.15.1-r0 do_configure: QA Issue: libxml2: configure was passed unrecognised options: --without-lzma [unknown-configure-option]
ERROR: libxml2-2.15.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libxml2-native/2.15.1/temp/log.do_configure.2527536
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxml2/2.15.1/temp/log.do_configure.2527947
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure) failed with exit code '1'

--===============2130396022860119122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.14.6-2.15.1.patch"

RnJvbSAyMDlmNDY5ODEzMDRkYzljYTUxYzNiZTAwOWIxMmFjOTJjOTI3ZDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNToxNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xNC42IC0+IDIuMTUuMQoKLS0tCiAuLi5ha2UtRml4LWluc3RhbGxh
dGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoIHwgMTIgKysrKysrLS0tLS0tCiBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoIHwgIDQgKyst
LQogbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaCB8
ICA2ICsrKy0tLQogLi4uL2xpYnhtbC97bGlieG1sMl8yLjE0LjYuYmIgPT4gbGlieG1sMl8yLjE1
LjEuYmJ9ICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC97bGlieG1sMl8yLjE0
LjYuYmIgPT4gbGlieG1sMl8yLjE1LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlv
bi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1s
L2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlvbi1kaXJlY3Rvcmllcy1p
bi1saWJ4bWwyLnBhdGNoCmluZGV4IDYyN2Y4NDcyYzMuLjExZTY4NzNmZmIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1p
bnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9u
LWRpcmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFhN2Ux
NzdhNzMxNWM4NTZhMmYwZTNjMmExN2VlMGZkOWUyOTdiYzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGZjMDM3ODk0YmY0OWIwOTA0ZTgyMDg4ZDIwZDc4MmRkZDAwOTBhNmIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVu
cy5jb20+CiBEYXRlOiBNb24sIDI2IE1heSAyMDI1IDIxOjExOjE0ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFJldmVydCAiY21ha2U6IEZpeCBpbnN0YWxsYXRpb24gZGlyZWN0b3JpZXMgaW4KQEAg
LTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29A
c2llbWVucy5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRl
eCBhYWEwMmUzLi5mYjI0MWJiIDEwMDY0NAoraW5kZXggNGViNjI5Yi4uMTUwZTA2ZSAxMDA2NDQK
IC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTA2NSwxNyArMTA2
NSw2IEBAIEFDX1NVQlNUKFhNTF9QUklWQVRFX0xJQlMpCitAQCAtMTAwNiwxNyArMTAwNiw2IEBA
IEFDX1NVQlNUKFhNTF9QUklWQVRFX0xJQlMpCiAgQUNfU1VCU1QoWE1MX1BSSVZBVEVfQ0ZMQUdT
KQogIEFDX1NVQlNUKFhNTF9JTkNMVURFRElSKQogIApAQCAtMzcsNyArMzcsNyBAQCBpbmRleCBh
YWEwMmUzLi5mYjI0MWJiIDEwMDY0NAogIEFDX0RFRklORV9VTlFVT1RFRChbWE1MX1NZU0NPTkZE
SVJdLCBbIiRYTUxfU1lTQ09ORkRJUiJdLAogICAgICAgICAgICAgICAgICAgICBbU3lzdGVtIGNv
bmZpZ3VyYXRpb24gZGlyZWN0b3J5ICgvZXRjKV0pCiBkaWZmIC0tZ2l0IGEvbGlieG1sMi1jb25m
aWcuY21ha2UuaW4gYi9saWJ4bWwyLWNvbmZpZy5jbWFrZS5pbgotaW5kZXggZTA0MGE3NS4uZGMw
ZDZiOCAxMDA2NDQKK2luZGV4IGZmNjQzM2YuLmI3NzVjZmUgMTAwNjQ0CiAtLS0gYS9saWJ4bWwy
LWNvbmZpZy5jbWFrZS5pbgogKysrIGIvbGlieG1sMi1jb25maWcuY21ha2UuaW4KIEBAIC0yNCwx
NyArMjQsMjAgQEAKQEAgLTY2LDEwICs2NiwxMCBAQCBpbmRleCBlMDQwYTc1Li5kYzBkNmI4IDEw
MDY0NAogIHNldChMSUJYTUwyX0xJQlJBUklFUyAke0xJQlhNTDJfTElCUkFSWX0pCiAgc2V0KExJ
QlhNTDJfSU5DTFVERV9ESVJTICR7TElCWE1MMl9JTkNMVURFX0RJUn0pCiBkaWZmIC0tZ2l0IGEv
bWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggOThiYzZlMy4uM2VmMGJkMCAxMDA2NDQK
K2luZGV4IDMxYzczYjYuLjg3Mjg4NTIgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIv
bWVzb24uYnVpbGQKLUBAIC01OTksOSArNTk5LDYgQEAgY29uZmlnX2NtYWtlID0gY29uZmlndXJh
dGlvbl9kYXRhKCkKK0BAIC01NzcsOSArNTc3LDYgQEAgY29uZmlnX2NtYWtlID0gY29uZmlndXJh
dGlvbl9kYXRhKCkKICBjb25maWdfY21ha2Uuc2V0KCdMSUJYTUxfTUFKT1JfVkVSU0lPTicsIHZf
bWFqKQogIGNvbmZpZ19jbWFrZS5zZXQoJ0xJQlhNTF9NSU5PUl9WRVJTSU9OJywgdl9taW4pCiAg
Y29uZmlnX2NtYWtlLnNldCgnTElCWE1MX01JQ1JPX1ZFUlNJT04nLCB2X21pYykKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoCmlu
ZGV4IDBiNzNiY2ViMjQuLjYxYTY5YTRhOGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMjUtNjAyMS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZTU0NmU0MjNkNjllYzliM2M3MTE2N2QzYzMxNDBmYTFiOWFmOTNjNyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMzJkMTQxMzM5YTE0NTAwOTM1NTc4Mjg3ZTUyODgxOWEyYWMwYjVl
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5pY2sgV2VsbG5ob2ZlciA8d2VsbG5o
b2ZlckBhZXZ1bS5kZT4KIERhdGU6IFR1ZSwgMjcgTWF5IDIwMjUgMTI6NTM6MTcgKzAyMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdHJlZTogRml4IGludGVnZXIgb3ZlcmZsb3cgaW4geG1sQnVpbGRRTmFt
ZQpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYg
LS1naXQgYS90cmVlLmMgYi90cmVlLmMKLWluZGV4IGUxNGJjNjIuLjIyZWMxMWMgMTAwNjQ0Citp
bmRleCBlNGZkMGQ2Li5lMzUzYzFmIDEwMDY0NAogLS0tIGEvdHJlZS5jCiArKysgYi90cmVlLmMK
IEBAIC0yMyw2ICsyMyw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwv
bGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCA0YzFmYWE4M2NiLi4xOGYzYTViMmFmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3Rz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVz
dHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdlOTlmZWY2ZWFlMDY0MmEzZjFlNTExZTRk
MjRhYmY3ZDZkMjhmNTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZlMGI2MzJmY2Vl
M2EyNzI1ODY0NDlkNDM1NDhlYTBkZWZiYjhiZWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1vbiwgNSBEZWMg
MjAyMiAxNzowMjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgeW9jdG8tc3BlY2lmaWMg
aW5zdGFsbC1wdGVzdCB0YXJnZXQKQEAgLTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5k
ZXggNmY5ODE0NC4uZWNiM2I1NCAxMDA2NDQKK2luZGV4IDE5ZWMzMDUuLjkxNjFhZjkgMTAwNjQ0
CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KLUBAIC0yNiw2ICsyNiwxNiBA
QCBjaGVja19QUk9HUkFNUyA9IFwKK0BAIC0yOSw2ICsyOSwxNiBAQCBjaGVja19QUk9HUkFNUyA9
IFwKICAJdGVzdHBhcnNlciBcCiAgCXRlc3RyZWN1cnNlCiAgCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE0LjYuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMl8yLjE1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNC42LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE1LjEuYmIKaW5kZXggNmVkODc2MGY0Yy4u
OGFkNzAwZDUxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJf
Mi4xNC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTUuMS5i
YgpAQCAtMjEsNyArMjEsNyBAQCBTUkNfVVJJICs9ICJodHRwOi8vd3d3LnczLm9yZy9YTUwvVGVz
dC94bWx0czIwMTMwOTIzLnRhcjtzdWJkaXI9JHtCUH07bmFtZT10ZXN0dAogICAgICAgICAgICBm
aWxlOi8vQ1ZFLTIwMjUtNjAyMS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiN2NlNDU4YTBhZmZlYjgzZjBiNTVmMWY0ZjllMGU1NTczNWRiZmMx
YTlkZTEyNGVlODZmYjRhNjZiNTk3MjAzYSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
ImMwMDhiYWMwOGZkNWM3YjRhODdmN2I4YTcxZjI4M2ZhNTgxZDgwZDgwZmY4ZDJlZmQzYjI2MjI0
YzM5YmM1NGMiCiBTUkNfVVJJW3Rlc3R0YXIuc2hhMjU2c3VtXSA9ICJjNmIyZDQyZWU1MGI4YjIz
NmU3MTFhOTdkNjhlNmM0YjVjOGQ4M2U2OWEyYmU0NzIyMzc5ZjA4NzAyZWE3MjczIgogCiBDVkVf
U1RBVFVTW0NWRS0yMDI1LTYxNzBdID0gImZpeGVkLXZlcnNpb246IGZpeGVkIGluIHZlcnNpb24g
Mi4xNC41IgotLSAKMi40Ny4xCgo=

--===============2130396022860119122==--

