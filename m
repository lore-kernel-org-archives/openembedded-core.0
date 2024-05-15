Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E30C2D0D0
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1238.1715794337452462740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VTUKiMVk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EiHzs6/N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f7d4fe279-485172b7-83e8-4d04-bb55-1dca76f0d098-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ERuC4TenhQeQEz2nmEZr8MHRh6uS4RDV0uJtFxkyT08=;
	b=VTUKiMVko4Vp1Wvqihw0XVoYT79ijAKh2KcSmPdU3nU+uCtRQ9hj0xUG5eW3SQQf
	oqN3ucHUkGVq0AN15TDF8uqIF2hf+AtnlG3w5Nz7Hcewf5TdeG+kbXu4YtI4SLPV1VD
	jdEStinyWScpTRlWZSREl1kRS9Q6Rypc1mRKOkeU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ERuC4TenhQeQEz2nmEZr8MHRh6uS4RDV0uJtFxkyT08=;
	b=EiHzs6/NKH5e336jjUItlz9lGtplMASEik6QP29nFer587yQVYkKSyrARli8zOtq
	+EJMxCI14Jg7s0mLhZ0/QiZoct9ciMHRJ7R+71+wnTkTjRKmcBWGWitVYr3ghXcOw7/
	HxOpz8Ta3/6dM9G8I/EdVvBMseKCLDcNnt/G6/qc=
Content-Type: multipart/mixed; boundary="===============7956518678577822048=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.5.6 FAILED
Message-ID: <0101018f7d4fe279-485172b7-83e8-4d04-bb55-1dca76f0d098-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199344

--===============7956518678577822048==
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
From 9417c674213269228ea4c3e4046f065bb82ede93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 12:36:28 +0000
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
2.44.0


--===============7956518678577822048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-c432805e83726c31aaa761c271c8f618693c9f06"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c432805e83726c31aaa761c271c8f618693c9f06"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 131 Local 82 Mirrors 0 Missed 49 Current 160 (62% match, 83% complete)
Removing 14 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch core2-64...done.
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
NOTE: Running setscene task 205 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 209 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 247 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 277 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 160 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 186 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: Running task 197 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 288 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: Running task 284 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: Running noexec task 289 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: Running task 438 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: Running noexec task 440 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: Running task 466 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: Running task 514 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 561 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 562 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 575 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_unpack)
NOTE: Running setscene task 290 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: Running noexec task 598 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 608 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: Running noexec task 614 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: Running setscene task 291 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 671 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_unpack)
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 672 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: Running task 673 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_unpack: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Started
NOTE: Running task 686 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 687 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 688 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 719 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: Running task 722 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_collect_spdx_deps)
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe zstd-native-1.5.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 724 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx)
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Succeeded
NOTE: Running task 725 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: Running task 726 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 730 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 735 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Failed
NOTE: recipe zstd-1.5.6-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 736 tasks of which 706 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515123605.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515123605.txt [-s server]
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/temp/log.do_patch.3825912
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/temp/log.do_patch.3826627
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'

--===============7956518678577822048==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.5.5-1.5.6.patch"

RnJvbSA5NDE3YzY3NDIxMzI2OTIyOGVhNGMzZTQwNDZmMDY1YmI4MmVkZTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTI6MzY6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB6
c3RkOiB1cGdyYWRlIDEuNS41IC0+IDEuNS42CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC96
c3RkL3t6c3RkXzEuNS41LmJiID0+IHpzdGRfMS41LjYuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3pzdGQve3pzdGRfMS41LjUuYmIgPT4genN0ZF8xLjUuNi5iYn0gKDk2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS41LmJiIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS41LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS42LmJiCmluZGV4IDJkNzJh
ZjUwYTQuLmI2NWFiODRlZmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3Rk
L3pzdGRfMS41LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUu
Ni5iYgpAQCAtMTMsNyArMTMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0wODIyYTMyZjdhY2RiZTAxMzYwNjc0NjY0MTc0NmVlOCBcCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vZmFjZWJvb2svenN0ZC5naXQ7YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9aHR0
cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1wenN0ZC11c2UtZGlyZWN0bHktZm9yLXRoZS10
ZXN0LWMtc25pcHBldC5wYXRjaCIKIAotU1JDUkVWID0gIjYzNzc5Yzc5ODIzNzM0NmMyYjI0NWM1
NDZjNDBiNzJhNWE1OTEzZmUiCitTUkNSRVYgPSAiNzk0ZWExYjBhZmNhMGYwMjBmNGU1N2I2NzMy
MzMyMjMxZmIyM2M3MCIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5c
ZCsoXC5cZCspKykiCiAKIENWRV9QUk9EVUNUID0gInpzdGFuZGFyZCIKLS0gCjIuNDQuMAoK

--===============7956518678577822048==--

