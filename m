Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C907ECD12A9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:27 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.44658.1711994603025594748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aGGXtne4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Uwg1/46a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e9ad48326-50738218-ba3f-4318-9381-e2b41960ed0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LO5CXPQm0rsIud0ni+CaTgag577OdIK0DJuNTdvMzR0=;
	b=aGGXtne4QiIXEdMksNjhbxwnMrBpYecNkQCNLaUKVgW44MFz82nNR4X/hsqeGihZ
	a8HcDCT+spg1xv+dCZFLmzV6R4K2AYC+7lXXVXgBf6CuLpS8Bm01AfBa7ymj1ceKDbJ
	68g0lHgXqgNpStsXVImjMaw0cT5koXpy32bSMdig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LO5CXPQm0rsIud0ni+CaTgag577OdIK0DJuNTdvMzR0=;
	b=Uwg1/46aTS43KmfgocIBkEI9MVJe/m88u7duuW51WG7gY07xBKEJI6b/exe8JCTM
	QZWixpIOVhliT1wEMI8aYant0GI+grbtWqq0XmWJZspXKiTeO1bCs6pOlp7fcG7p4oP
	1pDnGtXJ3/iMy+KdNJWv4Ck7syIXDpReFt8ssWaI=
Content-Type: multipart/mixed; boundary="===============6932282846922951600=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.5.6 FAILED
Message-ID: <0101018e9ad48326-50738218-ba3f-4318-9381-e2b41960ed0d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197796

--===============6932282846922951600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zstd* to *1.5.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.5.5-1.5.6.patch
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
From 495bc9ccefe905be6b5f92350ce94e7e5e69db1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 11:38:34 +0000
Subject: [PATCH] zstd: upgrade 1.5.5 -> 1.5.6

---
 meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} (96%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.6.bb
similarity index 96%
rename from meta/recipes-extended/zstd/zstd_1.5.5.bb
rename to meta/recipes-extended/zstd/zstd_1.5.6.bb
index 2d72af50a4..b65ab84efd 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
            file://0001-pzstd-use-directly-for-the-test-c-snippet.patch"
 
-SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
+SRCREV = "794ea1b0afca0f020f4e57b6732332231fb23c70"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.42.0


--===============6932282846922951600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ac2886b32b94160f297deb334048a4817f83236e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ac2886b32b94160f297deb334048a4817f83236e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 131 Local 80 Mirrors 0 Missed 51 Current 160 (61% match, 82% complete)
Removing 13 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 174 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 190 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 194 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 198 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 200 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 201 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 202 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 203 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 209 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 159 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa)
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 505 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 543 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: Running task 544 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 570 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 579 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: Running noexec task 586 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 595 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa)
NOTE: Running noexec task 601 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 609 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 648 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 656 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_fetch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 288 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Succeeded
NOTE: Running task 661 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 662 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 663 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 664 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 291 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 669 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1-r0: task do_fetch: Succeeded
NOTE: Running task 670 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 681 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_unpack: Succeeded
NOTE: Running task 715 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1-r0: task do_patch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_patch)
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Started
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Succeeded
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 721 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_patch: Succeeded
NOTE: Running task 726 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_generate_toolchain_file)
NOTE: recipe rpm-native-1_4.19.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 728 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 730 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: Running task 731 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 732 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 733 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: Running task 734 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_collect_spdx_deps)
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 735 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx)
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx: Started
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 736 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 737 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_patch)
NOTE: Running task 738 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Succeeded
NOTE: Running noexec task 740 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_configure)
NOTE: Running noexec task 741 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_compile)
NOTE: Running task 742 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_install)
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Failed
NOTE: recipe zstd-1.5.6-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 742 tasks of which 704 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401113808.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401113808.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: zstd-native-1.5.6-r0 do_patch: Applying patch '0001-pzstd-use-directly-for-the-test-c-snippet.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch
patching file contrib/pzstd/Makefile
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED -- rejects in file contrib/pzstd/Makefile
Patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch can be reverse-applied

stderr: ')
ERROR: zstd-1.5.6-r0 do_patch: Applying patch '0001-pzstd-use-directly-for-the-test-c-snippet.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch
patching file contrib/pzstd/Makefile
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED -- rejects in file contrib/pzstd/Makefile
Patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/temp/log.do_patch.348684
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/temp/log.do_patch.348915
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'

--===============6932282846922951600==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.5.5-1.5.6.patch"

RnJvbSA0OTViYzljY2VmZTkwNWJlNmI1ZjkyMzUwY2U5NGU3ZTVlNjlkYjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMTozODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHpz
dGQ6IHVwZ3JhZGUgMS41LjUgLT4gMS41LjYKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pz
dGQve3pzdGRfMS41LjUuYmIgPT4genN0ZF8xLjUuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvenN0ZC97enN0ZF8xLjUuNS5iYiA9PiB6c3RkXzEuNS42LmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjYuYmIKaW5kZXggMmQ3MmFm
NTBhNC4uYjY1YWI4NGVmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQv
enN0ZF8xLjUuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS42
LmJiCkBAIC0xMyw3ICsxMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTA4MjJhMzJmN2FjZGJlMDEzNjA2NzQ2NjQxNzQ2ZWU4IFwKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9mYWNlYm9vay96c3RkLmdpdDticmFuY2g9cmVsZWFzZTtwcm90b2NvbD1odHRw
cyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXB6c3RkLXVzZS1kaXJlY3RseS1mb3ItdGhlLXRl
c3QtYy1zbmlwcGV0LnBhdGNoIgogCi1TUkNSRVYgPSAiNjM3NzljNzk4MjM3MzQ2YzJiMjQ1YzU0
NmM0MGI3MmE1YTU5MTNmZSIKK1NSQ1JFViA9ICI3OTRlYTFiMGFmY2EwZjAyMGY0ZTU3YjY3MzIz
MzIyMzFmYjIzYzcwIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPlxk
KyhcLlxkKykrKSIKIAogQ1ZFX1BST0RVQ1QgPSAienN0YW5kYXJkIgotLSAKMi40Mi4wCgo=

--===============6932282846922951600==--

