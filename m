Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12EEEB59A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.29672.1694804393662200008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gaIb2G8e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MVMCM6D3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a9a36bb1e-88af15a2-4069-43aa-9bee-6960e4ab7428-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804392;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=QExt33bKtwslwxotm5C4o/t4n2b9khoVKhKsjh9v0/E=;
	b=gaIb2G8evZHRehnKHXkD4mEvpVXMDQNOKL/UbqNLIz9OvDDbqqZzK1GSlhPM6M4h
	e+c8QyiOOv5hWInbp4yKMy4gIJN7+xeoO78kNYsnsshN07agt5ypZTUFHGg+prDu1he
	//6ybG4yoUphBOVcan+CFMEx/fEGa5FvLqpfVsL0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804392;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=QExt33bKtwslwxotm5C4o/t4n2b9khoVKhKsjh9v0/E=;
	b=MVMCM6D3FQHEBAsDtYWYovDhD3CLcqe3CvfNtQIqqwwL0uUaN742acp1ubDFRW5T
	+/aLofKJOuvKPpp/Odj6mn1pgsn+4JLfexrwI5GASbTx+hWInFidvkcbjTOQsQOuRze
	iY3RWkxKlm3OaZwdGENhXPdL+RxWVj8yAO7ICYrM=
Content-Type: multipart/mixed; boundary="===============7385009407720932461=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.5 FAILED
Message-ID: <0101018a9a36bb1e-88af15a2-4069-43aa-9bee-6960e4ab7428-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187696

--===============7385009407720932461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.27.4-3.27.5.patch
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
From 530e12d7b95d6512134afb8638b919555245f615 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 08:13:39 +0000
Subject: [PATCH] cmake: upgrade 3.27.4 -> 3.27.5

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.4.bb => cmake_3.27.5.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.27.4.bb => cmake_3.27.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 430f13f4e1..ef4eec5ab1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af"
+SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.4.bb b/meta/recipes-devtools/cmake/cmake_3.27.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.5.bb
-- 
2.39.2


--===============7385009407720932461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-03bdcbf4bd952ef18c3c4bbfd77a39926e0a7df1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:03bdcbf4bd952ef18c3c4bbfd77a39926e0a7df1"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 130 Local 41 Mirrors 0 Missed 89 Current 271 (31% match, 77% complete)
Removing 14 stale sstate objects for arch core2-32...done.
Removing 20 stale sstate objects for arch qemux86...done.
Removing 15 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 286 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 295 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 308 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 323 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 336 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 344 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 364 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 372 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 338 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb:do_recipe_qa)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 458 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: Running noexec task 553 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 627 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe cmake-native-3.27.4-r0: task do_recipe_qa: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 628 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 634 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 642 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 643 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 648 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 654 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running setscene task 388 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: Running task 660 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 662 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 664 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 666 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 672 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 674 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: Running task 676 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 678 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 680 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_fetch)
NOTE: Running task 681 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 390 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: Running setscene task 392 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.27.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 731 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb:do_recipe_qa unihash changed to 5e649a49c4f0de2e62bc8fa4215df1021b9772762065352ef0d204d2d72f4efb
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe cmake-3.27.5-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.7.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 732 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_unpack)
NOTE: Running task 733 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 734 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb:do_fetch)
NOTE: Running task 739 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 740 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 741 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 743 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 744 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 745 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 746 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 747 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 748 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 749 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 750 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 751 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 752 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: Running task 754 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 756 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe cmake-3.27.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 757 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe cmake-native-3.27.4-r0: task do_fetch: Started
NOTE: Running task 758 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Started
WARNING: cmake-native-3.27.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz_bad-checksum_0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-3.27.5-r0: task do_fetch: Started
NOTE: Running task 770 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe cmake-3.27.5-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 772 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_unpack)
NOTE: Running task 773 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 774 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 775 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 776 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 396 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 398 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 777 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 778 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 779 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe cmake-3.27.5-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 781 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libarchive-3.7.1-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 782 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 790 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: Running task 791 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 795 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe util-linux-native-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 797 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 799 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 800 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe libarchive-3.7.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 804 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe util-linux-native-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.27.5-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_patch)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe cmake-3.27.5-r0: task do_patch: Started
NOTE: recipe cmake-3.27.5-r0: task do_patch: Succeeded
NOTE: Running task 846 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 847 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_generate_toolchain_file)
NOTE: Running task 848 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.5.bb:do_populate_lic)
NOTE: recipe cmake-3.27.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.27.5-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.27.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.27.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.27.5-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.27.5-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: cmake-native-3.27.4-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.27/cmake-3.27.4.tar.gz - will attempt other sources if available
WARNING: cmake-native-3.27.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz_bad-checksum_0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af
NOTE: recipe cmake-native-3.27.4-r0: task do_fetch: Failed
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 848 tasks of which 781 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.27.4-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.27/cmake-3.27.4.tar.gz
ERROR: cmake-native-3.27.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.4.tar.gz\' has sha256 checksum \'0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af\' when \'5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.27/cmake-3.27.4.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.27.4/temp/log.do_fetch.3376295
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb:do_fetch) failed with exit code '1'

--===============7385009407720932461==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.27.4-3.27.5.patch"

RnJvbSA1MzBlMTJkN2I5NWQ2NTEyMTM0YWZiODYzOGI5MTk1NTUyNDVmNjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDg6MTM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI3LjQgLT4gMy4yNy41CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI3LjQuYmIgPT4gY21ha2VfMy4yNy41LmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjcuNC5iYiA9PiBjbWFr
ZV8zLjI3LjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmlu
ZGV4IDQzMGYxM2Y0ZTEuLmVmNGVlYzVhYjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5q
b2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczov
L2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIu
Z3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE5MDVjYTg2MzVjYTgxYWExNTJlMTIz
YmRkZTdlNTRjYmU3NjRmZGQ5YTcwZDYyYWY0NGNhZDhiOTI5NjdhZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI1MTc1ZThmZTFjYTliMWRkMDkwOTAxMzBkYjcyMDE5NjhiY2NlMTU5NTk3MWZmOWU5
OTk4YzJmMDc2NTAwNGM5IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZl
cj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlXzMuMjcuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV8zLjI3LjUuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjUuYmIKLS0gCjIuMzkuMgoK

--===============7385009407720932461==--

