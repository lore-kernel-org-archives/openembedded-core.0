Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6444BC27C59
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.22188.1701436491388110421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VNSufk3c;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K/T0EX8k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018c25848329-fc69e636-07bd-42a7-adbf-13ff6a75bb9b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=08vSF7ErZwWwSIknPti3GUykm/7e3fjS3XXS9alrARc=;
	b=VNSufk3cbsA3F0/pbZRWTGkn0k2fYQxaAKVUNRXXNoOM0ngRM3xxpUH5UXuKMsnU
	I/2RIudlBK8VL/gPEZBxx82okAlOfc/bpcdUu3iProP4f4vDPybRhN0vibN8C5Vv2Id
	v2mgoS1E3w2ZVeOCXWM6iQcoR+tqRNeU3M7gqOVQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=08vSF7ErZwWwSIknPti3GUykm/7e3fjS3XXS9alrARc=;
	b=K/T0EX8kyUOyUAZYp/S5nPfKe9vLGOOJM1Xbk+wC5aOOHS7NzY1i5n6KgWkkxMEM
	viloDxI3U3kgnDBLU32tXlgYokwSz/Ju4AbSdWXtEiPMVM7abBxmR5HIw47iqM7+Ijt
	P8w17+nszelmbVZF/aXhVLpUanC6KxhuPlo8u0kk=
Content-Type: multipart/mixed; boundary="===============3617982795099348006=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.9 FAILED
Message-ID: <0101018c25848329-fc69e636-07bd-42a7-adbf-13ff6a75bb9b-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191592

--===============3617982795099348006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.27.7-3.27.9.patch
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
From d8b573589ad06e8f2a6bb179591366f6af1456f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 06:41:22 +0000
Subject: [PATCH] cmake: upgrade 3.27.7 -> 3.27.9

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.7.bb => cmake_3.27.9.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.27.7.bb => cmake_3.27.9.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ecb0e487df..bed5774d05 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
+SRC_URI[sha256sum] = "609a9b98572a6a5ea477f912cffb973109ed4d0a6a6b3f9e2353d2cdc048708e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.7.bb b/meta/recipes-devtools/cmake/cmake_3.27.9.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.7.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.9.bb
-- 
2.39.2


--===============3617982795099348006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e49661dae1600cdf95edd883d108293c8457b493"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e49661dae1600cdf95edd883d108293c8457b493"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 189 Local 96 Mirrors 0 Missed 93 Current 225 (50% match, 77% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 13 stale sstate objects for arch x86_64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 243 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 272 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 282 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 285 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 295 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 298 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 301 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 318 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 323 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 324 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 334 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 347 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 348 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-native-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 354 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 357 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 363 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 374 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-native-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 391 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 392 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-native-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 106 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: Running task 188 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_recipe_qa)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 235 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 306 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 308 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 329 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 333 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 342 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: Running task 344 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_fetch)
NOTE: Running task 347 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 351 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 353 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 355 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 359 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe cmake-native-3.27.7-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 362 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 366 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 457 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 491 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.27.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_recipe_qa unihash changed to e2f71c49165735908d595011d3790d5c1736440629b71420b3e2f35cd6cf770d
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 388 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 513 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch)
NOTE: Running task 538 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: Running task 603 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_unpack)
NOTE: Running task 659 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 660 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 676 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 677 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: Running task 685 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_unpack)
NOTE: Running task 698 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 707 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 710 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 711 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 712 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe cmake-native-3.27.7-r0: task do_fetch: Started
WARNING: cmake-native-3.27.7-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.7-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz_bad-checksum_08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 713 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Started
NOTE: Running task 714 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 715 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 405 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: Running task 723 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 724 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: Running task 730 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 732 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 733 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 734 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: Running task 738 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: Running task 741 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe curl-8.4.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 745 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 746 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_patch)
NOTE: Running task 747 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 749 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 750 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 752 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.4-r0: task do_patch: Started
NOTE: Running task 753 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 755 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_recipe_qa)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 756 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe cmake-3.27.9-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 833 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_patch)
NOTE: recipe curl-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_patch)
NOTE: Running task 835 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 836 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe cmake-3.27.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 837 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.2-r0: task do_patch: Started
NOTE: recipe curl-8.4.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: recipe openssl-3.1.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.27.9-r0: task do_fetch: Started
NOTE: recipe cmake-3.27.9-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 842 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe gnutls-native-3.8.2-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.27.9-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: Running task 846 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
WARNING: cmake-native-3.27.7-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.27/cmake-3.27.7.tar.gz - will attempt other sources if available
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 849 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
WARNING: cmake-native-3.27.7-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.7-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz_bad-checksum_08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Started
NOTE: recipe cmake-3.27.9-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_patch)
NOTE: recipe cmake-3.27.9-r0: task do_patch: Started
NOTE: recipe cmake-3.27.9-r0: task do_patch: Succeeded
NOTE: Running task 852 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 853 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_generate_toolchain_file)
NOTE: Running task 854 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.9.bb:do_populate_lic)
NOTE: recipe cmake-3.27.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.27.9-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.27.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.27.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.27.9-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.27.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 856 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_patch: Started
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.38+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.27.7-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 873 tasks of which 800 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201064052.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201064052.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.27.7-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.27/cmake-3.27.7.tar.gz
ERROR: cmake-native-3.27.7-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz\' has sha256 checksum \'08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e\' when \'609a9b98572a6a5ea477f912cffb973109ed4d0a6a6b3f9e2353d2cdc048708e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.27/cmake-3.27.7.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.27.7/temp/log.do_fetch.4020711
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch) failed with exit code '1'

--===============3617982795099348006==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.27.7-3.27.9.patch"

RnJvbSBkOGI1NzM1ODlhZDA2ZThmMmE2YmIxNzk1OTEzNjZmNmFmMTQ1NmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNjo0MToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjcuNyAtPiAzLjI3LjkKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjcuNy5iYiA9PiBjbWFrZV8zLjI3LjkuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4yNy43LmJiID0+IGNtYWtl
XzMuMjcuOS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5k
ZXggZWNiMGU0ODdkZi4uYmVkNTc3NGQwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpv
aW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8v
Y21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5n
eiBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwOGY3MWExMDYwMzZiZjA1MWY2OTI3NjBl
Zjk1NThjMDU3N2M0MmFjMzllOTZiYTA5N2U3NjYyYmQ0MTU4ZDhlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYwOWE5Yjk4NTcyYTZhNWVhNDc3ZjkxMmNmZmI5NzMxMDllZDRkMGE2YTZiM2Y5ZTIz
NTNkMmNkYzA0ODcwOGUiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVy
PlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2VfMy4yNy43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
XzMuMjcuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjcuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzMuMjcuOS5iYgotLSAKMi4zOS4yCgo=

--===============3617982795099348006==--

