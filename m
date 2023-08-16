Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7203FC3DA49
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173802.1692224343941388704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ARgOHT3C;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BIJXvnYH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e4be3-8172df33-edc1-4137-b36e-10113ebe0dc9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=F0VlOPhFPmtp+1tV8HOzbZWPS1FKaHEgk/SnuUTKk9k=;
	b=ARgOHT3CNcElcRWj6hrfT16tGn77opDap3A//AsXHFdnadbsP9cgswGhGPpbqssp
	6wiudyaC/kiggsx3TJBlrvLc/qrerhUxf7f920QNtVmuXl0ImzcvCSi39jLr7oJLfS8
	YftHz/60huNbIVKDOb/GRsGLwnZCm2VKG51DFphA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=F0VlOPhFPmtp+1tV8HOzbZWPS1FKaHEgk/SnuUTKk9k=;
	b=BIJXvnYH9phbL8JDZ4kLHDJgb+RUDY0ysdkjiMlrqMiHKKL0eWiDn5wC7a6h3VoW
	V2XQ61ZY7z4lruYpAFxLjgbuUez2Vm8MX0Xb3T+YV4xwG4OxBfs2mm7/EylV47awXeJ
	Wiq1Z+WCJRyOzjZ3RqmcER5axEhB7UgkC7/R8KWY=
Content-Type: multipart/mixed; boundary="===============0232498009844670677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.2 FAILED
Message-ID: <0101018a006e4be3-8172df33-edc1-4137-b36e-10113ebe0dc9-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186167

--===============0232498009844670677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.26.4-3.27.2.patch
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
From 7bffc2b8f54a805d95482b245308e1578ba429bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 02:38:34 +0000
Subject: [PATCH] cmake: upgrade 3.26.4 -> 3.27.2

---
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...akeDetermineSystem-use-oe-environment-vars-to-load.patch | 6 +++---
 .../cmake/{cmake_3.26.4.bb => cmake_3.27.2.bb}              | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake_3.26.4.bb => cmake_3.27.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f57a77c7bb..d4b0e8d210 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208"
+SRC_URI[sha256sum] = "798e50085d423816fe96c9ef8bee5e50002c9eca09fed13e300de8a91d35c211"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index d13c367e78..9cc94d3ac1 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 5acfcb2aba1a5641d390558fdf288373f5e39cb5 Mon Sep 17 00:00:00 2001
+From 05b5fefde9e4ebde68b19b672be59a95a099f03a Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,10 +25,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index 2c2c2ac3..fae4f97f 100644
+index 386be73f..582c2f29 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
-@@ -112,6 +112,13 @@ else()
+@@ -136,6 +136,13 @@ else()
    endif()
  endif()
  
diff --git a/meta/recipes-devtools/cmake/cmake_3.26.4.bb b/meta/recipes-devtools/cmake/cmake_3.27.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.26.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.2.bb
-- 
2.39.2


--===============0232498009844670677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:781cb5d3e87222f91889665e7c9ac0c54cd53474"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 120 Local 31 Mirrors 0 Missed 89 Current 281 (25% match, 77% complete)
Removing 24 stale sstate objects for arch core2-32...done.
Removing 20 stale sstate objects for arch qemux86...done.
Removing 14 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 296 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 323 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 346 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 354 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 355 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 372 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 373 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 348 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_recipe_qa)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 476 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 578 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe cmake-native-3.26.4-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 632 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 697 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 704 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 705 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 709 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 711 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: Running task 713 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: Running task 716 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 717 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 718 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_fetch)
NOTE: Running task 719 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 723 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 724 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
NOTE: Running task 725 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.2.bb:do_recipe_qa)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 765 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 773 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-3.26.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 774 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 395 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: Running task 775 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_recipe_qa unihash changed to 703a96267d23417a809470cc638c9ed2320b7f68dc3fdb9dc0589639d357b88d
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe cmake-3.27.2-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 776 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_unpack)
NOTE: Running task 777 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 778 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_fetch)
NOTE: Running task 779 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 780 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 781 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: Running task 782 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 783 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 784 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 392 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 392 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 785 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 786 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_unpack)
NOTE: Running task 787 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 788 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 790 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.26.4-r0: task do_fetch: Started
NOTE: Running task 792 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 793 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe cmake-3.27.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Started
NOTE: Running task 794 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.2.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
WARNING: cmake-native-3.26.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.26.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz_bad-checksum_313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: Running task 796 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 797 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 798 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe cmake-3.27.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 799 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe cmake-3.27.2-r0: task do_fetch: Succeeded
NOTE: Running task 800 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.2.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 801 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: Running task 802 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 398 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 400 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 804 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 805 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe cmake-3.27.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: Running task 808 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_fetch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 809 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 815 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 817 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 825 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 826 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 827 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 829 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe openssl-3.1.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
WARNING: cmake-native-3.26.4-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.26/cmake-3.26.4.tar.gz - will attempt other sources if available
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
WARNING: cmake-native-3.26.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.26.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz_bad-checksum_313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208
NOTE: recipe cmake-3.27.2-r0: task do_unpack: Succeeded
NOTE: recipe cmake-native-3.26.4-r0: task do_fetch: Failed
NOTE: Running task 835 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.2.bb:do_patch)
NOTE: recipe cmake-3.27.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe cmake-3.27.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 835 tasks of which 775 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.26.4-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.26/cmake-3.26.4.tar.gz
ERROR: cmake-native-3.26.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.26.4.tar.gz\' has sha256 checksum \'313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208\' when \'798e50085d423816fe96c9ef8bee5e50002c9eca09fed13e300de8a91d35c211\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.26/cmake-3.26.4.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.26.4/temp/log.do_fetch.3102289
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_fetch) failed with exit code '1'

--===============0232498009844670677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.26.4-3.27.2.patch"

RnJvbSA3YmZmYzJiOGY1NGE4MDVkOTU0ODJiMjQ1MzA4ZTE1NzhiYTQyOWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDI6Mzg6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI2LjQgLT4gMy4yNy4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uYWtlRGV0
ZXJtaW5lU3lzdGVtLXVzZS1vZS1lbnZpcm9ubWVudC12YXJzLXRvLWxvYWQucGF0Y2ggfCA2ICsr
Ky0tLQogLi4uL2NtYWtlL3tjbWFrZV8zLjI2LjQuYmIgPT4gY21ha2VfMy4yNy4yLmJifSAgICAg
ICAgICAgICAgfCAwCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjYuNC5i
YiA9PiBjbWFrZV8zLjI3LjIuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UuaW5jCmluZGV4IGY1N2E3N2M3YmIuLmQ0YjBlOGQyMTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0g
IiR7QCcuJy5qb2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9
ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0k
e1BWfS50YXIuZ3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzEzYjY4ODBjMjkxYmQ0
ZmUzMWMwYWE1MWQ2ZTYyNjU5MjgyYTUyMWU2OTVmMzBkNWNjMGQyNWFiYmQ1YzIwOCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3OThlNTAwODVkNDIzODE2ZmU5NmM5ZWY4YmVlNWU1MDAwMmM5ZWNh
MDlmZWQxM2UzMDBkZThhOTFkMzVjMjExIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFr
ZS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVTeXN0ZW0tdXNlLW9lLWVu
dmlyb25tZW50LXZhcnMtdG8tbG9hZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lU3lzdGVtLXVzZS1vZS1lbnZpcm9ubWVudC12YXJz
LXRvLWxvYWQucGF0Y2gKaW5kZXggZDEzYzM2N2U3OC4uOWNjOTRkM2FjMSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVTeXN0
ZW0tdXNlLW9lLWVudmlyb25tZW50LXZhcnMtdG8tbG9hZC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZVN5c3RlbS11c2Utb2Ut
ZW52aXJvbm1lbnQtdmFycy10by1sb2FkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YWNm
Y2IyYWJhMWE1NjQxZDM5MDU1OGZkZjI4ODM3M2Y1ZTM5Y2I1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwNWI1ZmVmZGU5ZTRlYmRlNjhiMTliNjcyYmU1OWE5NWEwOTlmMDNhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ29keSBQIFNjaGFmZXIgPGRldkBjb2R5cHMuY29t
PgogRGF0ZTogVGh1LCAyNyBBcHIgMjAxNyAxMTozNTowNSAtMDQwMAogU3ViamVjdDogW1BBVENI
XSBDTWFrZURldGVybWluZVN5c3RlbTogdXNlIG9lIGVudmlyb25tZW50IHZhcnMgdG8gbG9hZCBk
ZWZhdWx0CkBAIC0yNSwxMCArMjUsMTAgQEAgU2lnbmVkLW9mZi1ieTogT3RhdmlvIFNhbHZhZG9y
IDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCiAKIGRpZmYgLS1naXQgYS9Nb2R1bGVzL0NNYWtlRGV0ZXJtaW5lU3lzdGVtLmNtYWtlIGIv
TW9kdWxlcy9DTWFrZURldGVybWluZVN5c3RlbS5jbWFrZQotaW5kZXggMmMyYzJhYzMuLmZhZTRm
OTdmIDEwMDY0NAoraW5kZXggMzg2YmU3M2YuLjU4MmMyZjI5IDEwMDY0NAogLS0tIGEvTW9kdWxl
cy9DTWFrZURldGVybWluZVN5c3RlbS5jbWFrZQogKysrIGIvTW9kdWxlcy9DTWFrZURldGVybWlu
ZVN5c3RlbS5jbWFrZQotQEAgLTExMiw2ICsxMTIsMTMgQEAgZWxzZSgpCitAQCAtMTM2LDYgKzEz
NiwxMyBAQCBlbHNlKCkKICAgIGVuZGlmKCkKICBlbmRpZigpCiAgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4yNi40LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzMuMjcuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjYuNC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjcuMi5iYgotLSAKMi4zOS4y
Cgo=

--===============0232498009844670677==--

