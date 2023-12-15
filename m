Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D3FC4829B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.63603.1702649863187329629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W5u3zNNf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZYZMGjs5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c6dd7195c-92229a9a-3b0b-45bf-b882-7de57be8deb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=B/1Qwswu35rOTfcFH9Ike6lfSi2KG0AjBhtHVYkqodk=;
	b=W5u3zNNfiLSyQAkwbdRgHScwYGD0dgyPAP+VAk8mZxtiNCO76MJULkYkDUV2q0fX
	O61cgdHELJWNnMmmBRBeLzsfOLC/IrA4KSDC8KhCN6OnCwCg6y42d7kwb7cPVaenRxR
	B5n1CAYzN9cBil1kpI5AtHaPw6blETVbyXr/lU20=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=B/1Qwswu35rOTfcFH9Ike6lfSi2KG0AjBhtHVYkqodk=;
	b=ZYZMGjs5sPyld7p/x/N2ngMtGq9JMDmfqxjBJnYrMZL4Df7tXhMAqsXFU5lNzNrP
	teoQ5lkhEeD+DYTCYUb2A4Ffo2Teb5kD47eps4tjFhR0wdcO+4V0q5nd/lxaNQsSkBk
	8i90PmczDXSz/esAT3LE8tyfZkA75ZfjPHjUD3gs=
Content-Type: multipart/mixed; boundary="===============2973686526267978156=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.28.1 FAILED
Message-ID: <0101018c6dd7195c-92229a9a-3b0b-45bf-b882-7de57be8deb5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192447

--===============2973686526267978156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.28.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.27.7-3.28.1.patch
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
From 006b5129489611d68dec410a145a067692f339dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 06:28:32 +0000
Subject: [PATCH] cmake: upgrade 3.27.7 -> 3.28.1

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.7.bb => cmake_3.28.1.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.27.7.bb => cmake_3.28.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ecb0e487df..16bdb34b5e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
+SRC_URI[sha256sum] = "15e94f83e647f7d620a140a7a5da76349fc47a1bfed66d0f5cdee8e7344079ad"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.7.bb b/meta/recipes-devtools/cmake/cmake_3.28.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.7.bb
rename to meta/recipes-devtools/cmake/cmake_3.28.1.bb
-- 
2.42.0


--===============2973686526267978156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-2cd6afaa61f4c0e339ce238406d764c8c8b4b819"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2cd6afaa61f4c0e339ce238406d764c8c8b4b819"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 205 Local 112 Mirrors 0 Missed 93 Current 209 (54% match, 77% complete)
Removing 14 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch core2-64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 227 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 246 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 250 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 287 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 293 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 304 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 309 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 310 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 311 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 313 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 325 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 326 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running noexec task 240 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: Running noexec task 283 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 285 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 299 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 306 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: Running task 308 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_fetch)
NOTE: Running task 311 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 315 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 317 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 319 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 323 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 325 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 376 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 380 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: Running setscene task 384 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 397 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 327 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 399 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 350 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 357 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.27.7-r0: task do_recipe_qa: Started
NOTE: recipe expat-native-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: Running task 621 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 638 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 639 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: Running task 647 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 669 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 678 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 681 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 682 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 683 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 684 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-native-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 685 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 686 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 687 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 405 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 688 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 689 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 690 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 691 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 692 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe expat-native-2.5.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe expat-native-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: Running task 694 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 697 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 699 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe util-linux-native-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 702 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 709 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: Running task 711 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 714 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 717 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe cmake-native-3.27.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe curl-8.4.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_recipe_qa unihash changed to e2f71c49165735908d595011d3790d5c1736440629b71420b3e2f35cd6cf770d
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 718 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch)
NOTE: Running task 719 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 741 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_patch)
NOTE: Running task 742 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 743 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_patch)
NOTE: Running task 746 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 748 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 749 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 750 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 752 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: Running task 754 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 755 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_recipe_qa)
NOTE: recipe cmake-native-3.27.7-r0: task do_fetch: Started
WARNING: cmake-native-3.27.7-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.7-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz_bad-checksum_08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe openssl-3.2.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: recipe cmake-3.28.1-r0: task do_recipe_qa: Started
NOTE: recipe curl-8.4.0-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_patch: Started
NOTE: recipe curl-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 831 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 833 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 834 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe cmake-3.28.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 837 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: Running task 838 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_fetch)
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe expat-native-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe openssl-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe expat-native-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.28.1-r0: task do_fetch: Started
NOTE: recipe cmake-3.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 843 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe cmake-3.28.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 845 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 846 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: Running task 847 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 850 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_patch: Started
NOTE: recipe cmake-3.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 853 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_patch)
WARNING: cmake-native-3.27.7-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.27/cmake-3.27.7.tar.gz - will attempt other sources if available
NOTE: recipe cmake-3.28.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cmake-3.28.1-r0: task do_patch: Succeeded
NOTE: Running task 865 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 866 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_generate_toolchain_file)
NOTE: Running task 867 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.28.1.bb:do_populate_lic)
WARNING: cmake-native-3.27.7-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.7-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz_bad-checksum_08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e
NOTE: recipe cmake-3.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.28.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.28.1-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.28.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-3.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.38+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.27.7-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 880 tasks of which 808 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215062806.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215062806.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.27.7-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.27/cmake-3.27.7.tar.gz
ERROR: cmake-native-3.27.7-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.7.tar.gz\' has sha256 checksum \'08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e\' when \'15e94f83e647f7d620a140a7a5da76349fc47a1bfed66d0f5cdee8e7344079ad\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.27/cmake-3.27.7.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.27.7/temp/log.do_fetch.3512297
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb:do_fetch) failed with exit code '1'

--===============2973686526267978156==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.27.7-3.28.1.patch"

RnJvbSAwMDZiNTEyOTQ4OTYxMWQ2OGRlYzQxMGExNDVhMDY3NjkyZjMzOWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDY6Mjg6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI3LjcgLT4gMy4yOC4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI3LjcuYmIgPT4gY21ha2VfMy4yOC4xLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjcuNy5iYiA9PiBjbWFr
ZV8zLjI4LjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmlu
ZGV4IGVjYjBlNDg3ZGYuLjE2YmRiMzRiNWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5q
b2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczov
L2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIu
Z3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDhmNzFhMTA2MDM2YmYwNTFmNjkyNzYw
ZWY5NTU4YzA1NzdjNDJhYzM5ZTk2YmEwOTdlNzY2MmJkNDE1OGQ4ZSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIxNWU5NGY4M2U2NDdmN2Q2MjBhMTQwYTdhNWRhNzYzNDlmYzQ3YTFiZmVkNjZkMGY1
Y2RlZThlNzM0NDA3OWFkIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZl
cj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlXzMuMjcuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV8zLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI4LjEuYmIKLS0gCjIuNDIuMAoK

--===============2973686526267978156==--

