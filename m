Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D96C54754
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.131097.1723748334320940315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Lm8TXRx1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=k+sRaOSF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019157683886-736a5c0d-e75e-4488-8d1c-aa6942416f52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yJbr7qtc6QnCnZkbYq+kCWT4kHYi4VUp8nUQQf36nXo=;
	b=Lm8TXRx1yS3xh7tUpd1qH7t3GCr0PV/8BIZvuZSSjEoWRiSWOOEOIFufld8tzOMe
	9PVZ96GaloGoe//Dfe/52qDy/OzPv3NA0/3GanSfuQfN5alf5sjSiuLE7CY9z2y5nzg
	uyeJzHVpBEF6k+RrkKdK7dRZshB5wAvQ0Gg1EH3s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yJbr7qtc6QnCnZkbYq+kCWT4kHYi4VUp8nUQQf36nXo=;
	b=k+sRaOSFlVAyLkLTJGu2dmrd2lkjwPm2SoU1wHFxyedYwrbGlC2BDeKk6MwaOqJA
	uGtvh0EZZm/G+TuB3psM1lFPmdbsAY3q8KYRmVSauGHqp3QSWycHd7X+c0+wLhHnYmf
	9gQs98RJhOJrgzXHehbWdnfXA777/qckENV4OMaM=
Content-Type: multipart/mixed; boundary="===============8419458864696223798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.73.3 FAILED
Message-ID: <0101019157683886-736a5c0d-e75e-4488-8d1c-aa6942416f52-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203366

--===============8419458864696223798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdnf* to *0.73.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.73.2-0.73.3.patch
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
From 0571df3c24904c7568143abc678339245ae4f086 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 10:26:42 +0000
Subject: [PATCH] libdnf: upgrade 0.73.2 -> 0.73.3

---
 ...FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch | 2 +-
 ...Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch | 4 ++--
 .../libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch     | 2 +-
 ...Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 4 ++--
 meta/recipes-devtools/libdnf/libdnf/armarch.patch             | 2 +-
 .../libdnf/libdnf/enable_test_data_dir_set.patch              | 4 ++--
 .../libdnf/{libdnf_0.73.2.bb => libdnf_0.73.3.bb}             | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.2.bb => libdnf_0.73.3.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 046e09eab2..52e7426371 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,4 +1,4 @@
-From 5d6db56791d326e6b486dca54fe2335af0225229 Mon Sep 17 00:00:00 2001
+From 09ff4670e0717ea1a79430c14e108f93fb6f5f34 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
 Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 223c1be218..3f70b855c8 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From bf9bde4af952b67cc357d25b9863889099ea9665 Mon Sep 17 00:00:00 2001
+From 15de1b4266b85ffdf17fad374a43e0ed315b9f22 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e99b28d0..548a9137 100644
+index a6f14318..60c66e94 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -51,7 +51,7 @@ endif()
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index 27f76077d7..5d77bcb41a 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From a6b3bc4fb3db996cd6c5616a99c16d085704dae0 Mon Sep 17 00:00:00 2001
+From 2a4a5f2da7d1b578619a8d0886f6db00bacefdc2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index ecab47e5af..25d6109525 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From e40def862bdeb10da295b15c5904fe2829d391c7 Mon Sep 17 00:00:00 2001
+From 9fb0e6130ef5d9fa68240c279d235eee8658c0fa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6444c374..e99b28d0 100644
+index c6bd46a6..a6f14318 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -51,7 +51,8 @@ endif()
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 63debdb58f..54df0aab99 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From aa0f8b65feec64420a9b7b61cfcc8bcce161e14b Mon Sep 17 00:00:00 2001
+From 8159808516543237fb110d0883e702385a1a866c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index e4f6d447f1..986b71c4e6 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 25229773a9d4472235278bb45f75439e56630cee Mon Sep 17 00:00:00 2001
+From 3d77c2ff41b1a65d0f4852ed21d7a8ec41b368a8 Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
@@ -14,7 +14,7 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 548a9137..c378e7d9 100644
+index 60c66e94..1459dfbf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -132,7 +132,12 @@ add_definitions(-DGETTEXT_DOMAIN=\\"libdnf\\")
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
index ed433d4a9f..e4a34f8ff6 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "86bbb159732e43dd6dff98c96e99382843f7c63b"
+SRCREV = "fbd34472e5edea0a3ed88ae14a47666e23538e4a"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============8419458864696223798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-624273230c6fcb7b6fe4138fc5daace6dd6ef9f6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:624273230c6fcb7b6fe4138fc5daace6dd6ef9f6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 313 Local 300 Mirrors 0 Missed 13 Current 502 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1766 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_recipe_qa)
NOTE: recipe libdnf-0.73.3-r0: task do_recipe_qa: Started
NOTE: recipe libdnf-0.73.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2244 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_fetch)
NOTE: recipe libdnf-0.73.3-r0: task do_fetch: Started
NOTE: recipe libdnf-0.73.3-r0: task do_fetch: Succeeded
NOTE: Running task 2245 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_unpack)
NOTE: Running task 2246 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.73.3-r0: task do_unpack: Started
NOTE: recipe libdnf-0.73.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.73.3-r0: task do_unpack: Succeeded
NOTE: Running task 2247 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_patch)
NOTE: Running task 2248 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.73.3-r0: task do_patch: Started
NOTE: recipe libdnf-0.73.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.73.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdnf-0.73.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdnf-0.73.3-r0: task do_patch: Succeeded
NOTE: Running task 2249 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2250 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_generate_toolchain_file)
NOTE: Running task 2251 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_populate_lic)
NOTE: recipe libdnf-0.73.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.73.3-r0: task do_populate_lic: Started
NOTE: recipe libdnf-0.73.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdnf-0.73.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdnf-0.73.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libdnf-0.73.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2252 of 2264 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_configure)
NOTE: recipe libdnf-0.73.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.30.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.17.0.bb:do_popula
 te_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.30.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninj
 a_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/swig/swig_4.2.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libmodulemd', 'librepo', 'libtool-native', 'lua', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'rpm', 'bzip2', 'cracklib', 'libarchive', 'libidn2', 'libnsl2', 'libsolv', 'libtirpc', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'gtk-doc', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'curl', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'gpgme', 'libassuan', 'libcap-ng', 'libcap', 'libcheck', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'libyaml', 'nettle', 'popt', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-nati
 ve', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'swig-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'gtk-doc-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| Running CMake on libdnf...
| -- The C compiler identification is GNU 14.2.0
| -- The CXX compiler identification is GNU 14.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| Building libdnf version: 0.73.3
| -- Found PkgConfig: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Checking for modules 'libsolv;libsolvext'
| --   Found libsolv, version 0.7.30
| --   Found libsolvext, version 0.7.30
| -- Checking for module 'check'
| --   Found check, version 0.15.2
| -- Checking for module 'gio-unix-2.0>=2.46.0'
| --   Found gio-unix-2.0, version 2.80.2
| -- Checking for module 'json-c'
| --   Found json-c, version 0.17
| -- Checking for module 'modulemd-2.0>=2.11.2'
| --   Found modulemd-2.0, version 2.15.0
| -- Checking for module 'librepo>=1.18.0'
| --   Requested 'librepo >= 1.18.0' but version of librepo is 1.17.0
| CMake Error at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:645 (message):
|   The following required packages were not found:
| 
|    - librepo>=1.18.0
| 
| Call Stack (most recent call first):
|   /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:873 (_pkg_check_modules_internal)
|   CMakeLists.txt:65 (pkg_check_modules)
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/temp/run.do_configure.3236211:179 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/bin/python3-native/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/bin/python3-native/pyth
 on3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/recipe-sysroot-native/usr/bin/python3-native/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DPYTHON_INSTALL_DIR=/usr/lib/python3.12/site-packages -DWITH_MAN=OFF -DPYTHON_DESIRED=3 -DWITH_GIR=ON -DWITH_TESTS=OFF -DWITH_ZCHUNK=OFF -DWITH_HTML=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/temp/run.do_configure.3236211, line 179
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/temp/run.do_configure.3236211, line 158
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/temp/run.do_configure.3236211, line 204
NOTE: recipe libdnf-0.73.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2252 tasks of which 2242 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815102625.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815102625.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libdnf-0.73.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/temp/run.do_configure.3236211', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdnf/0.73.3/temp/log.do_configure.3236211
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb:do_configure) failed with exit code '1'

--===============8419458864696223798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.73.2-0.73.3.patch"

RnJvbSAwNTcxZGYzYzI0OTA0Yzc1NjgxNDNhYmM2NzgzMzkyNDVhZTRmMDg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTA6MjY6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IHVwZ3JhZGUgMC43My4yIC0+IDAuNzMuMwoKLS0tCiAuLi5GaW5kR3RrRG9jLmNtYWtl
LWRyb3AtdGhlLXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoIHwgMiArLQogLi4uR2V0
LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGlic29sdi1hbmQtbGlic29sdmV4dC1saWJkbi5wYXRjaCB8
IDQgKystLQogLi4uL2xpYmRuZi9saWJkbmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNt
YWtlLnBhdGNoICAgICB8IDIgKy0KIC4uLlNldC1saWJzb2x2LXZhcmlhYmxlcy13aXRoLXBrZy1j
b25maWctY21ha2Utcy1vd24tbW8ucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9saWJkbmYvbGliZG5mL2FybWFyY2gucGF0Y2ggICAgICAgICAgICAgfCAyICstCiAuLi4vbGli
ZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2ggICAgICAgICAgICAgIHwg
NCArKy0tCiAuLi4vbGliZG5mL3tsaWJkbmZfMC43My4yLmJiID0+IGxpYmRuZl8wLjczLjMuYmJ9
ICAgICAgICAgICAgIHwgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL3tsaWJk
bmZfMC43My4yLmJiID0+IGxpYmRuZl8wLjczLjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNtYWtlLWRy
b3AtdGhlLXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNtYWtlLWRyb3AtdGhlLXJlcXVp
cmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoCmluZGV4IDA0NmUwOWVhYjIuLjUyZTc0MjYzNzEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtRmlu
ZEd0a0RvYy5jbWFrZS1kcm9wLXRoZS1yZXF1aXJlbWVudC1mb3ItR1RLRE9DX1NDQS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLUZpbmRHdGtEb2Mu
Y21ha2UtZHJvcC10aGUtcmVxdWlyZW1lbnQtZm9yLUdUS0RPQ19TQ0EucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDVkNmRiNTY3OTFkMzI2ZTZiNDg2ZGNhNTRmZTIzMzVhZjAyMjUyMjkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA5ZmY0NjcwZTA3MTdlYTFhNzk0MzBjMTRlMTA4
ZjkzZmI2ZjVmMzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjQgTm92IDIwMTYgMTQ6
MzM6MDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRmluZEd0a0RvYy5jbWFrZTogZHJvcCB0aGUg
cmVxdWlyZW1lbnQgZm9yCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5m
L2xpYmRuZi8wMDAxLUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZl
eHQtbGliZG4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAx
LUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGliZG4ucGF0
Y2gKaW5kZXggMjIzYzFiZTIxOC4uM2Y3MGI4NTVjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1HZXQtcGFyYW1ldGVycy1mb3ItYm90aC1saWJz
b2x2LWFuZC1saWJzb2x2ZXh0LWxpYmRuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9saWJkbmYvbGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGlic29sdi1hbmQt
bGlic29sdmV4dC1saWJkbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmY5YmRlNGFmOTUy
YjY3Y2MzNTdkMjViOTg2Mzg4OTA5OWVhOTY2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMTVkZTFiNDI2NmI4NWZmZGYxN2ZhZDM3NGE0M2UwZWQzMTViOWYyMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogVHVlLCA3IEZlYiAyMDE3IDEyOjE2OjAzICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEdldCBwYXJhbWV0ZXJzIGZvciBib3RoIGxpYnNvbHYgYW5kIGxpYnNvbHZleHQgKGxpYmRu
ZiBpcwpAQCAtMTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0
cy50eHQKLWluZGV4IGU5OWIyOGQwLi41NDhhOTEzNyAxMDA2NDQKK2luZGV4IGE2ZjE0MzE4Li42
MGM2NmU5NCAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4
dAogQEAgLTUxLDcgKzUxLDcgQEAgZW5kaWYoKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1kcm9wLUZpbmRQ
eXRob25JbnN0RGlyLmNtYWtlLnBhdGNoCmluZGV4IDI3Zjc2MDc3ZDcuLjVkNzdiY2I0MWEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtZHJvcC1G
aW5kUHl0aG9uSW5zdERpci5jbWFrZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliZG5mL2xpYmRuZi8wMDAxLWRyb3AtRmluZFB5dGhvbkluc3REaXIuY21ha2UucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGE2YjNiYzRmYjNkYjk5NmNkNmM1NjE2YTk5YzE2ZDA4NTcwNGRh
ZTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJhNGE1ZjJkYTdkMWI1Nzg2MTlhOGQw
ODg2ZjZkYjAwYmFjZWZkYzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUg
SmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDEgSnVuIDIwMjEgMTA6
MjM6NTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHJvcCBGaW5kUHl0aG9uSW5zdERpci5jbWFr
ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1T
ZXQtbGlic29sdi12YXJpYWJsZXMtd2l0aC1wa2ctY29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12
YXJpYWJsZXMtd2l0aC1wa2ctY29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoCmluZGV4IGVjYWI0
N2U1YWYuLjI1ZDYxMDk1MjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJk
bmYvbGliZG5mLzAwMDQtU2V0LWxpYnNvbHYtdmFyaWFibGVzLXdpdGgtcGtnLWNvbmZpZy1jbWFr
ZS1zLW93bi1tby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRu
Zi8wMDA0LVNldC1saWJzb2x2LXZhcmlhYmxlcy13aXRoLXBrZy1jb25maWctY21ha2Utcy1vd24t
bW8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU0MGRlZjg2MmJkZWIxMGRhMjk1YjE1YzU5
MDRmZTI4MjlkMzkxYzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlmYjBlNjEzMGVm
NWQ5ZmE2ODI0MGMyNzlkMjM1ZWVlODY1OGMwZmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZy
aSwgMzAgRGVjIDIwMTYgMTg6MjQ6NTAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IGxpYnNv
bHYgdmFyaWFibGVzIHdpdGggcGtnLWNvbmZpZyAoY21ha2UncyBvd24gbW9kdWxlCkBAIC0xMiw3
ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4
IDY0NDRjMzc0Li5lOTliMjhkMCAxMDA2NDQKK2luZGV4IGM2YmQ0NmE2Li5hNmYxNDMxOCAxMDA2
NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTUxLDcg
KzUxLDggQEAgZW5kaWYoKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRu
Zi9saWJkbmYvYXJtYXJjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGli
ZG5mL2FybWFyY2gucGF0Y2gKaW5kZXggNjNkZWJkYjU4Zi4uNTRkZjBhYWI5OSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvYXJtYXJjaC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBhYTBmOGI2NWZlZWM2NDQyMGE5YjdiNjFjZmNjOGJjY2UxNjFlMTRi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MTU5ODA4NTE2NTQzMjM3ZmIxMTBkMDg4
M2U3MDIzODVhMWE4NjZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQ
dXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUaHUsIDkg
Tm92IDIwMjMgMTA6Mjk6MzEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZG5mOiBGaXggYXJt
IGFyY2ggbWFwcGluZyBpc3N1ZXMgZm9yIHFlbXVhcm12NQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvZW5hYmxlX3Rlc3RfZGF0YV9kaXJfc2V0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvZW5hYmxlX3Rlc3RfZGF0YV9k
aXJfc2V0LnBhdGNoCmluZGV4IGU0ZjZkNDQ3ZjEuLjk4NmI3MWM0ZTYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3Nl
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFibGVf
dGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI1MjI5NzczYTlk
NDQ3MjIzNTI3OGJiNDVmNzU0MzllNTY2MzBjZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDNkNzdjMmZmNDFiMWE2NWQwZjQ4NTJlZDIxZDdhOGVjNDFiMzY4YTggTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBXZWQsIDIyIEp1bCAyMDIwIDEzOjMxOjExIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGxpYmRuZjogYWxsb3cgcmVwcm9kdWNpYmxlIGJpbmFyeSBidWlsZHMKQEAgLTE0LDcgKzE0LDcg
QEAgU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDU0OGE5MTM3Li5j
Mzc4ZTdkOSAxMDA2NDQKK2luZGV4IDYwYzY2ZTk0Li4xNDU5ZGZiZiAxMDA2NDQKIC0tLSBhL0NN
YWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTEzMiw3ICsxMzIsMTIgQEAg
YWRkX2RlZmluaXRpb25zKC1ER0VUVEVYVF9ET01BSU49XFwibGliZG5mXFwiKQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My4yLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzMu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My4z
LmJiCmluZGV4IGVkNDMzZDRhOWYuLmU0YTM0ZjhmZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzMuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZl8wLjczLjMuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYmRuZjticmFuY2g9
ZG5mLTQtbWFzdGVyO3AKICAgICAgICAgICAgZmlsZTovL2FybWFyY2gucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ1JFViA9ICI4NmJiYjE1OTczMmU0M2RkNmRmZjk4Yzk2ZTk5MzgyODQzZjdj
NjNiIgorU1JDUkVWID0gImZiZDM0NDcyZTVlZGVhMGEzZWQ4OGFlMTRhNDc2NjZlMjM1MzhlNGEi
CiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4oPyE0XC45MClcZCsoXC5c
ZCspKykiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjQ0LjAKCg==

--===============8419458864696223798==--

