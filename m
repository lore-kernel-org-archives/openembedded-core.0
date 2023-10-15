Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F382C04FE4
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.102660.1697399113819216805
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K/c/OcCv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gAK44D+a;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df04ee-45061053-834f-4467-ab63-4868bf94ffac-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Ax7zo5s3iCFU+FWSl6dhTtGBHfRosvZhajIdAjws4aw=;
	b=K/c/OcCvBRCJc6ydn46JU/zrj/7HvXjKg04WJYEEAulPtVRH596yeL85wr7GHRGG
	PNfkIsm7YEoSuiHoNg2MAqIHqOjDZqREimM7ZqDKlkZCAcs8MA2J6maDgSdGN5h901L
	hwUHCOVrsEOnKKMaQHlPtLfblmReNBvcKUBkd1q0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Ax7zo5s3iCFU+FWSl6dhTtGBHfRosvZhajIdAjws4aw=;
	b=gAK44D+a8l4c9lhieALo66JEBUnkAIseLE91nYwyf7t+Ea6tuyc9iVjAPyCi1EBt
	kgg/drJm2jet4haS0BITF9DoxtMEvNTyJXcPKzoWXC5l7JvBF8qSvRkKnVJFKK5Z0ck
	Fo/xN+NlKXczoBv5dNxrB16XjUJxznOTRg5E9ah0=
Content-Type: multipart/mixed; boundary="===============2324944509927207725=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.7 FAILED
Message-ID: <0101018b34df04ee-45061053-834f-4467-ab63-4868bf94ffac-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189168

--===============2324944509927207725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.27.5-3.27.7.patch
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
From 2dd66340e62157ad2e1069a6f4b02c46973d21b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 08:48:05 +0000
Subject: [PATCH] cmake: upgrade 3.27.5 -> 3.27.7

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ef4eec5ab1..ecb0e487df 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
+SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.5.bb b/meta/recipes-devtools/cmake/cmake_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.7.bb
-- 
2.39.2


--===============2324944509927207725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3f58a155e25cdebccf39cc9955a702f171ca5ccf"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3f58a155e25cdebccf39cc9955a702f171ca5ccf"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 156 Local 67 Mirrors 0 Missed 89 Current 245 (42% match, 77% complete)
Removing 14 stale sstate objects for arch x86_64...done.
Removing 23 stale sstate objects for arch core2-32...done.
Removing 20 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 261 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 272 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 280 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 295 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 309 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 334 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 340 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 375 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 298 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_recipe_qa)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 369 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 454 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: Running task 560 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_recipe_qa)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 583 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 584 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 586 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 587 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 588 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 590 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 591 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 592 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 593 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 389 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-3.27.5-r0: task do_recipe_qa: Started
NOTE: Running task 596 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-3.27.7-r0: task do_recipe_qa: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-native-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 391 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 597 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 598 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: Running task 600 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 618 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 621 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 622 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: Running task 625 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 626 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe cmake-native-3.27.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: Running task 643 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_recipe_qa unihash changed to ddcb5f78a1c1844635225fb39e69e52b6435f3971ac6e5f5923d77c5ca7953d5
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe libnsl2-native-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: Running setscene task 385 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 673 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: recipe curl-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 395 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 396 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 728 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 745 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 746 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 747 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 748 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: Running task 749 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_unpack)
NOTE: Running task 756 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 757 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 758 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 760 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 761 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 762 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 763 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 778 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Started
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz_bad-checksum_5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
NOTE: Running task 779 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 780 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: Running task 781 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe cmake-3.27.7-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.3-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: Running task 782 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 783 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: Running task 798 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 804 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 805 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: Running task 806 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 400 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-3.27.7-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 807 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 809 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 811 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 816 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 824 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 825 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe openssl-3.1.3-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 826 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: Running task 827 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_patch)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 837 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe cmake-3.27.7-r0: task do_patch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe cmake-3.27.7-r0: task do_patch: Succeeded
NOTE: Running task 839 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 840 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_generate_toolchain_file)
NOTE: Running task 841 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_populate_lic)
NOTE: recipe cmake-3.27.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.27.7-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.27.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.27.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz - will attempt other sources if available
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz_bad-checksum_5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Failed
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 841 tasks of which 777 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.27.5-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz
ERROR: cmake-native-3.27.5-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz\' has sha256 checksum \'5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9\' when \'08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.27.5/temp/log.do_fetch.3466929
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch) failed with exit code '1'

--===============2324944509927207725==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.27.5-3.27.7.patch"

RnJvbSAyZGQ2NjM0MGU2MjE1N2FkMmUxMDY5YTZmNGIwMmM0Njk3M2QyMWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDg6NDg6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI3LjUgLT4gMy4yNy43CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI3LjUuYmIgPT4gY21ha2VfMy4yNy43LmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjcuNS5iYiA9PiBjbWFr
ZV8zLjI3LjcuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmlu
ZGV4IGVmNGVlYzVhYjEuLmVjYjBlNDg3ZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5q
b2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczov
L2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIu
Z3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTE3NWU4ZmUxY2E5YjFkZDA5MDkwMTMw
ZGI3MjAxOTY4YmNjZTE1OTU5NzFmZjllOTk5OGMyZjA3NjUwMDRjOSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwOGY3MWExMDYwMzZiZjA1MWY2OTI3NjBlZjk1NThjMDU3N2M0MmFjMzllOTZiYTA5
N2U3NjYyYmQ0MTU4ZDhlIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZl
cj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlXzMuMjcuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV8zLjI3LjcuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjcuYmIKLS0gCjIuMzkuMgoK

--===============2324944509927207725==--

