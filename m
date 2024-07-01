Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B385C52CDA
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2178.1719853075960535777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UJy5H6me;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IOqRUbBi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101906f3b4a53-f656352f-b1d8-47df-9e2c-4d72047f922b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=oneuNPB+jRRvGiJVLFvqY7o3ftxos6aHScbVxcDWso8=;
	b=UJy5H6meWGH0McQvbOoYJAyP8NI+VJHcWCdYPyAB0iFC8c1WfoJdV4608wzzuybV
	3+09MURjznaWyNLXnLc02YDkw3MmMXo9a6Pq3IWqKBtE/FxBh1xAmPxAFb3mCLfLKdP
	Sq45+qZTrT7X31qVja1on7SqfKO3qp81hM3X+vuY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=oneuNPB+jRRvGiJVLFvqY7o3ftxos6aHScbVxcDWso8=;
	b=IOqRUbBim3pC576I62Y3OeQ+9iGlLcT03I+uvLTxRSuFQ9ya703YVocQoyT70KuK
	oZmCN9+bB8nUS6zlo9H7eRsL9LFX/1TfjkxLGdCOMID2HG11FmADz3K2DS6XIqsk/tZ
	BFG405CV6MMRx4YLHD5kuyq14s49VBTuRzqV51Hw=
Content-Type: multipart/mixed; boundary="===============0884118126868256583=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.29.6 FAILED
Message-ID: <010101906f3b4a53-f656352f-b1d8-47df-9e2c-4d72047f922b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201331

--===============0884118126868256583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.29.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.29.3-3.29.6.patch
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
From d356e86afaa1c32c6a773779bb85c1ddadf4fa4b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 07:11:00 +0000
Subject: [PATCH] cmake: upgrade 3.29.3 -> 3.29.6

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.29.6.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.29.6.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1155c1bbe0..88a74cf40e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"
+SRC_URI[sha256sum] = "1391313003b83d48e2ab115a8b525a557f78d8c1544618b48d1d90184a10f0af"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.29.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.6.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.29.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.29.6.bb
-- 
2.44.0


--===============0884118126868256583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (916 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-01d3a981a1d37e9ac744758d34f4ba39ea9e1444"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:01d3a981a1d37e9ac744758d34f4ba39ea9e1444"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 237 Local 138 Mirrors 0 Missed 99 Current 180 (58% match, 76% complete)
Removing 20 stale sstate objects for arch qemux86_64...done.
Removing 17 stale sstate objects for arch core2-64...done.
Removing 14 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 199 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 212 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 214 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 219 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 227 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 231 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 244 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 257 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 266 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 272 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 273 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 279 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 284 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 285 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 303 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 321 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 327 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 333 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 335 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20240517-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 337 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 338 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 339 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 346 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 347 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-native-20240517-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 350 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 351 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 355 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 363 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 380 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 381 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-native-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 390 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 395 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 411 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 185 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 310 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_recipe_qa)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 426 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 461 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_fetch)
NOTE: Running task 471 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 473 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 479 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_fetch)
NOTE: Running task 482 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: Running task 484 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe cmake-native-3.29.3-r0: task do_recipe_qa: Started
NOTE: Running task 492 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 493 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 496 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: Running task 497 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 553 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe python3-native-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 554 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 555 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Started
NOTE: Running setscene task 415 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 556 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 557 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: Running task 558 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 559 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 560 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 561 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_unpack)
NOTE: Running task 562 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.29.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 563 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_recipe_qa unihash changed to 502cc1b245d32d816bafe48185fe74b08e0a8412574c634139b085d2eec599f0
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.12.4-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Started
NOTE: recipe python3-native-3.12.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 564 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_fetch)
NOTE: Running task 568 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: Running task 569 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch)
NOTE: Running task 570 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 571 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: Running task 572 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 573 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: Running task 574 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: Running task 575 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 576 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_patch)
NOTE: Running task 577 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: Running task 578 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: Running task 579 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: Running task 580 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_unpack)
NOTE: Running noexec task 582 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_fetch)
NOTE: Running task 584 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe cmake-native-3.29.3-r0: task do_fetch: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_fetch: Started
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.29.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz_bad-checksum_252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 585 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_unpack)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 586 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 618 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: Running task 620 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_fetch)
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_unpack: Started
NOTE: recipe python3-native-3.12.4-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.4-r0: task do_patch: Succeeded
NOTE: Running task 625 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 654 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 655 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: Running task 656 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running task 657 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_unpack)
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 659 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 660 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 661 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Succeeded
NOTE: Running task 681 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: Running task 683 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 686 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 695 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 709 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 710 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 711 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 713 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 714 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 715 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: Running task 722 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 726 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_fetch)
NOTE: Running task 727 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 728 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 729 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: Running task 730 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 731 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 732 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe curl-8.8.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 734 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_unpack)
NOTE: Running task 740 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 741 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 744 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 745 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe curl-8.8.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: Running task 748 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 749 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 750 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 751 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: Running task 752 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: Running task 756 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 758 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 759 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: Running task 761 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz - will attempt other sources if available
NOTE: Running task 764 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_recipe_qa)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 771 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.6-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: Running task 839 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_patch: Started
NOTE: Running task 840 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_generate_toolchain_file)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 843 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: recipe curl-8.8.0-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Started
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.29.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz_bad-checksum_252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb
NOTE: recipe python3-native-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 845 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 846 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe cmake-3.29.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_fetch)
NOTE: Running task 848 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 850 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe python3-native-3.12.4-r0: task do_patch: Started
NOTE: recipe cmake-3.29.6-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe cmake-3.29.6-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe cmake-3.29.6-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.6-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_patch)
NOTE: recipe python3-native-3.12.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.6-r0: task do_patch: Started
NOTE: recipe cmake-3.29.6-r0: task do_patch: Succeeded
NOTE: Running task 860 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 861 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_generate_toolchain_file)
NOTE: Running task 862 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.6.bb:do_populate_lic)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.29.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.29.6-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.29.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.29.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cmake-3.29.6-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-native-3.29.3-r0: task do_fetch: Failed
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 863 tasks of which 757 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701071009.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701071009.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.29.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz
ERROR: cmake-native-3.29.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.29.3.tar.gz\' has sha256 checksum \'252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb\' when \'1391313003b83d48e2ab115a8b525a557f78d8c1544618b48d1d90184a10f0af\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.29.3/temp/log.do_fetch.1261834
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch) failed with exit code '1'

--===============0884118126868256583==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.29.3-3.29.6.patch"

RnJvbSBkMzU2ZTg2YWZhYTFjMzJjNmE3NzM3NzliYjg1YzFkZGFkZjRmYTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNzoxMTowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjkuMyAtPiAzLjI5LjYKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjkuMy5iYiA9PiBjbWFrZV8zLjI5LjYuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4yOS4zLmJiID0+IGNtYWtl
XzMuMjkuNi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5k
ZXggMTE1NWMxYmJlMC4uODhhNzRjZjQwZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpv
aW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8v
Y21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5n
eiBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNTJhZWUxNDQ4ZDQ5Y2FhMDQ5NTRmZDVl
MjdkMTg5ZGQ1MTU3MDU1NzMxM2U3YjI4MTYzNjcxNmEyMzhiY2NiIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjEzOTEzMTMwMDNiODNkNDhlMmFiMTE1YThiNTI1YTU1N2Y3OGQ4YzE1NDQ2MThiNDhk
MWQ5MDE4NGExMGYwYWYiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVy
PlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2VfMy4yOS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
XzMuMjkuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjkuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzMuMjkuNi5iYgotLSAKMi40NC4wCgo=

--===============0884118126868256583==--

