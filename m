Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62CEC3DA65
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:30 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18372.1718475799216777303
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Y/zvk7Kt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ESxGLhl9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101901d23b778-09edbff5-088f-4911-9d6c-1348109cc194-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=20ZbDMLBnnjDvdfrRCY4uFQjWKXhosyzbkquqD27O28=;
	b=Y/zvk7Kt7YPYYEzVrLhU5QeGU4E/LFXoIlOkQz0+3TnWocudAnevzFf+HAWVXPh7
	MwMUuzyoHQ8Zm6tPU7mHr554JBjC5FxbkZZg0wprel4YjMW45CYnt7NFYF1wYfkZqPP
	kvKe4MKsDLbAqW42Jxn310cQtRizQVggpHRy502M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=20ZbDMLBnnjDvdfrRCY4uFQjWKXhosyzbkquqD27O28=;
	b=ESxGLhl9kskeCt563QRe6y28/4pMuCibthWLlKHekreiIXDYoQOSHM8EE/nPWXoL
	bXG95tv+gtZEx+OVRTCN2hySrbZRd/rFpg8gK/sJguI7ZwqYu95Gx2zezQiVPLm1RuM
	5WgjNMBg3ROrGgQSyEdQIa4V4mtv7xzSSnZopgCY=
Content-Type: multipart/mixed; boundary="===============3353255689120333328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.29.5 FAILED
Message-ID: <010101901d23b778-09edbff5-088f-4911-9d6c-1348109cc194-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200691

--===============3353255689120333328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.29.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.29.3-3.29.5.patch
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
From 5ec45937801d835811d3d478cec1faf19b83f5f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 07:18:52 +0000
Subject: [PATCH] cmake: upgrade 3.29.3 -> 3.29.5

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.29.5.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.29.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1155c1bbe0..821068f017 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"
+SRC_URI[sha256sum] = "dd63da7d763c0db455ca232f2c443f5234fe0b11f8bd6958a81d29cc987dfd6e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.29.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.29.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.29.5.bb
-- 
2.44.0


--===============3353255689120333328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1885 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (918 cached, 2 parsed). 1881 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-070e31c652424256a87ee2c5f7459042af92fb55"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:070e31c652424256a87ee2c5f7459042af92fb55"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 234 Local 135 Mirrors 0 Missed 99 Current 183 (57% match, 76% complete)
Removing 20 stale sstate objects for arch qemux86_64...done.
Removing 20 stale sstate objects for arch core2-64...done.
Removing 14 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 202 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 216 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 218 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 227 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 231 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 235 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 244 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 248 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 269 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 270 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 277 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 283 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 289 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 293 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 321 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 329 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 331 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 334 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 335 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 336 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 337 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 339 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20240517-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 340 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 348 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 350 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 354 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libedit-native-20240517-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 363 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe openssl-native-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 390 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 391 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 392 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 395 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 411 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 185 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_fetch)
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 310 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_recipe_qa)
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 425 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running noexec task 437 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_fetch)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 447 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 454 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 480 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 481 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 484 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 485 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: Running task 487 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe cmake-native-3.29.3-r0: task do_recipe_qa: Started
NOTE: Running task 495 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 496 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_unpack)
NOTE: Running task 498 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 513 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 514 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 515 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: Running task 516 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 413 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 415 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-3.29.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Started
NOTE: Running task 519 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 520 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_recipe_qa unihash changed to 502cc1b245d32d816bafe48185fe74b08e0a8412574c634139b085d2eec599f0
NOTE: recipe libarchive-native-3.7.4-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.12.4-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-native-3.12.4-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 528 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: Running task 529 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch)
NOTE: Running task 530 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 531 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: Running task 532 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: Running task 533 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 534 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: Running task 535 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 537 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_unpack)
NOTE: Running task 538 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running task 539 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: Running task 546 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: Running task 555 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_unpack)
NOTE: Running task 575 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe cmake-native-3.29.3-r0: task do_fetch: Started
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.29.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz_bad-checksum_252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_unpack: Started
NOTE: Running noexec task 577 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_fetch)
NOTE: Running task 579 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 580 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe python3-native-3.12.4-r0: task do_unpack: Started
NOTE: Running task 611 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 612 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: Running task 615 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 616 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 618 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 619 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 622 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_unpack)
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 624 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 625 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 626 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 655 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 656 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: Running task 659 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 660 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 681 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_patch: Succeeded
NOTE: Running task 683 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 686 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 687 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: Running task 694 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 695 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 696 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 697 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 698 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 699 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 702 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 703 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 716 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Started
NOTE: Running task 720 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 725 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 729 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 730 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 733 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 740 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe curl-8.8.0-r0: task do_fetch: Started
NOTE: Running task 741 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe curl-8.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 743 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_unpack: Started
NOTE: Running task 745 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 748 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Succeeded
NOTE: Running task 749 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 751 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 752 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: Running task 753 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 757 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 760 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 763 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 765 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_recipe_qa)
NOTE: Running task 769 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 796 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe python3-native-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: Running task 839 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: recipe curl-8.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_patch)
NOTE: recipe cmake-3.29.5-r0: task do_recipe_qa: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_patch: Started
NOTE: recipe python3-native-3.12.4-r0: task do_patch: Started
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz - will attempt other sources if available
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 846 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe curl-8.8.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 848 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: recipe cmake-3.29.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 849 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Started
NOTE: recipe cmake-3.29.5-r0: task do_fetch: Started
NOTE: recipe cmake-3.29.5-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_unpack)
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.29.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz_bad-checksum_252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 853 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe cmake-3.29.5-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.12.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.5-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_patch)
NOTE: recipe cmake-3.29.5-r0: task do_patch: Started
NOTE: recipe cmake-3.29.5-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_generate_toolchain_file)
NOTE: Running task 864 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.5.bb:do_populate_lic)
NOTE: recipe cmake-3.29.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.29.5-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.29.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.29.5-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.29.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cmake-native-3.29.3-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 865 tasks of which 757 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615071823.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615071823.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.29.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz
ERROR: cmake-native-3.29.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz\' has sha256 checksum \'252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb\' when \'dd63da7d763c0db455ca232f2c443f5234fe0b11f8bd6958a81d29cc987dfd6e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.29.3/temp/log.do_fetch.1266851
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch) failed with exit code '1'

--===============3353255689120333328==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.29.3-3.29.5.patch"

RnJvbSA1ZWM0NTkzNzgwMWQ4MzU4MTFkM2Q0NzhjZWMxZmFmMTliODNmNWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDc6MTg6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI5LjMgLT4gMy4yOS41CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI5LjMuYmIgPT4gY21ha2VfMy4yOS41LmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjkuMy5iYiA9PiBjbWFr
ZV8zLjI5LjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmlu
ZGV4IDExNTVjMWJiZTAuLjgyMTA2OGYwMTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5q
b2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczov
L2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIu
Z3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjUyYWVlMTQ0OGQ0OWNhYTA0OTU0ZmQ1
ZTI3ZDE4OWRkNTE1NzA1NTczMTNlN2IyODE2MzY3MTZhMjM4YmNjYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZDYzZGE3ZDc2M2MwZGI0NTVjYTIzMmYyYzQ0M2Y1MjM0ZmUwYjExZjhiZDY5NThh
ODFkMjljYzk4N2RmZDZlIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZl
cj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlXzMuMjkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV8zLjI5LjUuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjUuYmIKLS0gCjIuNDQuMAoK

--===============3353255689120333328==--

