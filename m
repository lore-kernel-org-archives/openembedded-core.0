Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D5CC2BBF5
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.39616.1656687062426210900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k/iIWzDQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181ba3e6933-77828675-e718-4c7b-a3ee-e320c3ecbd1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=StIJFgfGyDJD/kntRv27corU3Bff/JQh7KlaAC6pEfQ=;
	b=k/iIWzDQDw/sHWyQuvqo9djrqbV1PpLn5RY4FyDAdWBU8xNa4IHMgYkGbZrxkQtd
	GjXMkT3xw7tKT4BnIDXbL2AfB9HHJ9RERqF1FWny0WkYq7vtMkfbd2nkGDmcHGBeF+a
	foZNlz+qp9BNk9GESUC0re9YSxJTdWSUbmUH2ENo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=StIJFgfGyDJD/kntRv27corU3Bff/JQh7KlaAC6pEfQ=;
	b=GWa9VchDnbpaznRy7VDGaooHOC6xCKwagIkqWddddULD4NbwIVQdOBjP1B24CxEP
	X2FWc1h4i0WJz4SbPkvA+J2P0DZJ+oOiLX5YaJ3rmZ8MYg3rEFFge110uOeMXR1Q+6M
	RkekMG9dS9ITbDcIsfeNm2BRVL1PudNvVFghmzR4=
Content-Type: multipart/mixed; boundary="===============8848525150755325176=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.62.0 FAILED
Message-ID: 
 <01010181ba3e6933-77828675-e718-4c7b-a3ee-e320c3ecbd1c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167479

--===============8848525150755325176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.62.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 36 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-32 sysroot...done.
Removing 35 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b21d86cf293dbf100ff50c71cf0873122e2c1fa7"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b21d86cf293dbf100ff50c71cf0873122e2c1fa7"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 79 Local 39 Mirrors 0 Missed 40 Current 132 (49% match, 81% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 157 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 161 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 166 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 458 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_fetch)
NOTE: Running task 530 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_fetch)
NOTE: Running task 579 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 580 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_fetch)
NOTE: Running task 581 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 582 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 583 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_fetch)
NOTE: Running task 584 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 585 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_fetch)
NOTE: Running task 587 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 589 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: Running task 592 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_fetch)
NOTE: Running task 606 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_fetch: Started
NOTE: recipe rust-native-1.60.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-1.60.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.60.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Started
NOTE: Running task 609 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 610 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 611 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Succeeded
NOTE: Running task 612 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 613 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 183 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Started
NOTE: Running setscene task 185 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 627 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: Running setscene task 187 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 188 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: Running task 632 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 633 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 634 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: Running task 635 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: Running task 636 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 191 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 193 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 195 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Succeeded
NOTE: Running task 639 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 196 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 199 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 642 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe glibc-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 203 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Succeeded
NOTE: Running task 649 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Succeeded
NOTE: Running task 650 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 208 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 668 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 669 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 670 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 741 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 746 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 753 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 754 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 755 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 756 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 757 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Succeeded
NOTE: Running task 758 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_fetch: Succeeded
NOTE: Running task 759 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_unpack)
NOTE: Running task 760 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 761 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_unpack)
NOTE: Running task 762 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_unpack)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 763 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Started
NOTE: recipe rust-native-1.60.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.60.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-1.60.0-r0: task do_fetch: Succeeded
NOTE: Running task 764 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_unpack)
NOTE: Running task 765 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_unpack)
NOTE: Running task 766 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_unpack)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 767 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe rust-native-1.60.0-r0: task do_unpack: Started
NOTE: recipe cargo-1.60.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 768 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 769 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 770 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 771 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 772 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 773 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 774 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 775 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 776 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_unpack: Succeeded
NOTE: Running task 777 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_patch)
NOTE: Running task 778 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_rust_setup_snapshot)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_patch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 779 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 780 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_rust_gen_targets)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_unpack: Succeeded
NOTE: Running task 781 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_patch)
NOTE: recipe libstd-rs-1.60.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 782 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 783 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_patch)
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 785 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_generate_toolchain_file)
NOTE: Running task 786 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 787 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_configure)
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_configure: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 788 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_compile)
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_compile: Started
NOTE: recipe rust-native-1.60.0-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_patch)
NOTE: Running task 790 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.60.0-r0: task do_patch: Started
NOTE: recipe rust-native-1.60.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 791 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 792 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.60.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.60.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.60.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe cargo-native-1.60.0-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_patch)
NOTE: Running task 794 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-native-1.60.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_patch: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cargo-native-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-native-1.60.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe cargo-1.60.0-r0: task do_unpack: Succeeded
NOTE: Running task 796 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_patch)
NOTE: Running task 797 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-1.60.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-1.60.0-r0: task do_patch: Started
NOTE: recipe cargo-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 798 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 799 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_populate_lic)
NOTE: recipe cargo-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-1.60.0-r0: task do_populate_lic: Started
NOTE: recipe cargo-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.60.0-r0: task do_populate_lic: Succeeded
NOTE: recipe cargo-1.60.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 800 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 801 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 802 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 803 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 804 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 805 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 806 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_compile)
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 807 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_install)
NOTE: recipe libidn2-2.3.2-r0: task do_install: Started
NOTE: recipe libidn2-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 808 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot)
NOTE: Running task 809 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_package: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 810 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 811 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_configure)
NOTE: recipe curl-7.83.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.2-r0: task do_package: Succeeded
NOTE: Running task 812 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_configure: Succeeded
NOTE: Running task 813 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_compile)
NOTE: recipe curl-7.83.1-r0: task do_compile: Started
NOTE: recipe curl-7.83.1-r0: task do_compile: Succeeded
NOTE: Running task 814 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_install)
NOTE: recipe curl-7.83.1-r0: task do_install: Started
NOTE: recipe curl-7.83.1-r0: task do_install: Succeeded
NOTE: Running task 815 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_populate_sysroot)
NOTE: Running task 816 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_package)
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_package: Started
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_package: Succeeded
NOTE: Running task 817 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_packagedata)
NOTE: recipe curl-7.83.1-r0: task do_packagedata: Started
NOTE: recipe curl-7.83.1-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_compile: Succeeded
NOTE: Running task 818 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_install)
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_install: Succeeded
NOTE: Running task 819 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb:do_populate_sysroot)
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 820 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 821 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-native-1.60.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.60.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 822 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_configure)
NOTE: recipe rust-native-1.60.0-r0: task do_configure: Started
NOTE: recipe rust-native-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 823 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_compile)
NOTE: recipe rust-native-1.60.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_compile
NOTE: recipe rust-native-1.60.0-r0: task do_compile: Succeeded
NOTE: Running task 824 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_install)
NOTE: recipe rust-native-1.60.0-r0: task do_install: Started
NOTE: recipe rust-native-1.60.0-r0: task do_install: Succeeded
NOTE: Running task 825 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.60.0.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-native-1.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 826 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 827 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 828 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 829 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 830 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_configure)
NOTE: Running task 831 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_configure)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_configure: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_configure: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 832 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_compile)
NOTE: recipe cargo-native-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 833 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_compile)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_compile: Succeeded
NOTE: Running task 834 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_install)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_install: Succeeded
NOTE: Running task 835 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_populate_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cargo-native-1.60.0-r0: task do_compile: Succeeded
NOTE: Running task 836 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_install)
NOTE: recipe cargo-native-1.60.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_install: Succeeded
NOTE: Running task 837 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 838 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 839 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.60.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 840 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_configure)
NOTE: recipe libstd-rs-1.60.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 841 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_compile)
NOTE: recipe libstd-rs-1.60.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_compile: Succeeded
NOTE: Running task 842 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_install)
NOTE: recipe libstd-rs-1.60.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_install: Succeeded
NOTE: Running task 843 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot)
NOTE: Running task 844 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_package)
NOTE: recipe libstd-rs-1.60.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 845 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 846 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-1.60.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-1.60.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 847 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_configure)
NOTE: recipe cargo-1.60.0-r0: task do_configure: Started
NOTE: recipe cargo-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 848 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_compile)
NOTE: recipe cargo-1.60.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_package: Succeeded
NOTE: Running task 849 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: cargo = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot-native/usr/bin/cargo
| Usage: which [options] [--] COMMAND [...]
| Write the full path of COMMAND(s) to standard output.
| 
|   --version, -[vV] Print version and exit successfully.
|   --help,          Print this help and exit successfully.
|   --skip-dot       Skip directories in PATH that start with a dot.
|   --skip-tilde     Skip directories in PATH that start with a tilde.
|   --show-dot       Don't expand a dot to current directory in output.
|   --show-tilde     Output a tilde for HOME directory for non-root.
|   --tty-only       Stop processing options on the right if not on tty.
|   --all, -a        Print all matches in PATH, not just the first
|   --read-alias, -i Read list of aliases from stdin.
|   --skip-alias     Ignore option --read-alias; don't read stdin.
|   --read-functions Read shell functions from stdin.
|   --skip-functions Ignore option --read-functions; don't read stdin.
| 
| Recommended use is to write the output of (alias; declare -f) to standard
| input, so that which can show aliases and shell functions. See which(1) for
| examples.
| 
| If the options --read-alias and/or --read-functions are specified then the
| output can be a full alias or function definition, optionally followed by
| the full path of each command used inside of those.
| 
| Report bugs to <which-bugs@gnu.org>.
| NOTE: rustc =
| NOTE: cargo build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/src/tools/cargo//Cargo.toml
|    Compiling libc v0.2.116
|    Compiling pkg-config v0.3.18
|    Compiling autocfg v1.0.0
|    Compiling proc-macro2 v1.0.30
|    Compiling syn v1.0.80
|    Compiling unicode-xid v0.2.2
|    Compiling serde_derive v1.0.125
|    Compiling cfg-if v1.0.0
|    Compiling serde v1.0.125
|    Compiling memchr v2.4.1
|    Compiling cfg-if v0.1.10
|    Compiling log v0.4.14
|    Compiling matches v0.1.8
|    Compiling crc32fast v1.2.0
|    Compiling bitflags v1.2.1
|    Compiling getrandom v0.2.0
|    Compiling tinyvec v0.3.4
|    Compiling percent-encoding v2.1.0
|    Compiling ryu v1.0.5
|    Compiling getrandom v0.1.14
|    Compiling lazy_static v1.4.0
|    Compiling serde_json v1.0.59
|    Compiling anyhow v1.0.51
|    Compiling once_cell v1.7.2
|    Compiling typenum v1.12.0
|    Compiling regex-automata v0.1.10
|    Compiling crossbeam-utils v0.8.6
|    Compiling regex-syntax v0.6.25
|    Compiling openssl v0.10.35
|    Compiling itoa v0.4.6
|    Compiling openssl-probe v0.1.2
|    Compiling ppv-lite86 v0.2.8
|    Compiling foreign-types-shared v0.1.1
|    Compiling curl v0.4.41
|    Compiling hashbrown v0.11.2
|    Compiling byteorder v1.3.4
|    Compiling same-file v1.0.6
|    Compiling version_check v0.9.3
|    Compiling remove_dir_all v0.5.3
|    Compiling fnv v1.0.7
|    Compiling semver v1.0.3
|    Compiling termcolor v1.1.2
|    Compiling utf8parse v0.1.1
|    Compiling bytes v1.0.1
|    Compiling either v1.6.0
|    Compiling hex v0.3.2
|    Compiling hex v0.4.2
|    Compiling smallvec v1.7.0
|    Compiling shell-escape v0.1.5
|    Compiling textwrap v0.15.0
|    Compiling humantime v2.0.1
|    Compiling strsim v0.10.0
|    Compiling lazycell v1.3.0
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/libc-0.2.116/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=d037728999df84bc -C extra-filename=-d037728999df84bc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/libc-d037728999df84bc -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name pkg_config /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/pkg-config/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=9f248601c7e1ade4 -C extra-filename=-9f248601c7e1ade4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name autocfg /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/autocfg-1.0.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=a666cdefedf9bb83 -C extra-filename=-a666cdefedf9bb83 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/proc-macro2-1.0.30/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=c7041dc8a252118e -C extra-filename=-c7041dc8a252118e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/proc-macro2-c7041dc8a252118e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/syn-1.0.80/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="extra-traits"' --cfg 'feature="fold"' --cfg 'feature="full"' --cfg 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"' --cfg 'feature="quote"' --cfg 'feature="visit"' --cfg 'feature="visit-mut"' -C metadata=6a0f819028b1c653 -C extra-filename=-6a0f819028b1c653 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/syn-6a0f819028b1c653 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/carg
 o/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=3f9e964215576218 -C extra-filename=-3f9e964215576218 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/serde_derive-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=ee131b2a4944cc28 -C extra-filename=-ee131b2a4944cc28 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/serde_derive-ee131b2a4944cc28 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=29fa95b255c53b46 -C extra-filename=-29fa95b255c53b46 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target
 /release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/serde-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"' --cfg 'feature="std"' -C metadata=78961b5ccb83a023 -C extra-filename=-78961b5ccb83a023 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/serde-78961b5ccb83a023 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/memchr/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=6b3ec43a6d9a9cb0 -C extra-filename=-6b3ec43a6d9a9cb0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/memchr-6b3ec43a6d9a9cb0 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4900f7cf59ef11c1 -C extra-filename=-4900f7cf59ef11c1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/log/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=1b10c698a9cc2495 -C extra-filename=-1b10c698a9cc2495 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/log-1b10c698a9cc2495 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name matches /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/matches-0.1.8/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b68992495516de2b -C extra-filename=-b68992495516de2b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/crc32fast-1.2.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=755dcb0dae2632e2 -C extra-filename=-755dcb0dae2632e2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/crc32fast-755dcb0dae2632e2 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/bitflags-1.2.1/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=9a9704b3d5d185d4 -C extra-filename=-9a9704b3d5d185d4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/bitflags-9a9704b3d5d185d4 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/getrandom/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=95a3fd6e3b653e7b -C extra-filename=-95a3fd6e3b653e7b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/getrandom-95a3fd6e3b653e7b -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name tinyvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/tinyvec-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' -C metadata=7f7e748cb20fa42e -C extra-filename=-7f7e748cb20fa42e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name percent_encoding /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/percent-encoding/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=380d06c9601be706 -C extra-filename=-380d06c9601be706 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/ryu-1.0.5/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c5c5bd6e45ecc53f -C extra-filename=-c5c5bd6e45ecc53f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/ryu-c5c5bd6e45ecc53f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/getrandom-0.1.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=fc52d8ce22410bec -C extra-filename=-fc52d8ce22410bec --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/getrandom-fc52d8ce22410bec -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
| warning: target json file contains unused fields: has-elf-tls
| 
|      Running `rustc --crate-name lazy_static /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/lazy_static/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ff72ab8946451d6b -C extra-filename=-ff72ab8946451d6b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/rele
 ase/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/serde_json-1.0.59/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="raw_value"' --cfg 'feature="std"' --cfg 'feature="unbounded_depth"' -C metadata=97d385e59c2f8c78 -C extra-filename=-97d385e59c2f8c78 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/serde_json-97d385e59c2f8c78 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/anyhow-1.0.51/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=8015a808b39c99a1 -C extra-filename=-8015a808b39c99a1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/anyhow-8015a808b39c99a1 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name once_cell --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/once_cell-1.7.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' --cfg 'feature="race"' --cfg 'feature="std"' -C metadata=60318161937ecfd3 -C extra-filename=-60318161937ecfd3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_main /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/typenum/build/main.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=3e1dc6e6a667c567 -C extra-filename=-3e1dc6e6a667c567 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/typenum-3e1dc6e6a667c567 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name regex_automata /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/regex-automata/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d2ca31bc372c9b31 -C extra-filename=-d2ca31bc372c9b31 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/crossbeam-utils-0.8.6/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=f686239c1b98207b -C extra-filename=-f686239c1b98207b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/crossbeam-utils-f686239c1b98207b -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow
 `
|      Running `rustc --crate-name regex_syntax --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/regex-syntax/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="unicode"' --cfg 'feature="unicode-age"' --cfg 'feature="unicode-bool"' --cfg 'feature="unicode-case"' --cfg 'feature="unicode-gencat"' --cfg 'feature="unicode-perl"' --cfg 'feature="unicode-script"' --cfg 'feature="unicode-segment"' -C metadata=0415a41f2f314fbd -C extra-filename=-0415a41f2f314fbd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/targ
 et-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/openssl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=d6369cd612110d48 -C extra-filename=-d6369cd612110d48 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/openssl-d6369cd612110d48 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name itoa /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/itoa-0.4.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ed32eb9fc94ad2fc -C extra-filename=-ed32eb9fc94ad2fc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps
  --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=7efe5c704a5b4c0c -C extra-filename=-7efe5c704a5b4c0c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name openssl_probe /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/openssl-probe/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=bb8f2735b3a73ce7 -C extra-filename=-bb8f2735b3a73ce7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/
 release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name ppv_lite86 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/ppv-lite86/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="simd"' --cfg 'feature="std"' -C metadata=8255f1ed3d790c8d -C extra-filename=-8255f1ed3d790c8d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=5783836431f5a2ee -C extra-filename=-5783836431f5a2ee --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name foreign_types_shared /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/foreign-types-shared/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8fc5c57fa84b14ba -C extra-filename=-8fc5c57fa84b14ba --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/curl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="http2"' --cfg 'feature="openssl-probe"' --cfg 'feature="openssl-sys"' --cfg 'feature="ssl"' -C metadata=e47b08211d6e96ed -C extra-filename=-e47b08211d6e96ed --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/curl-e47b08211d6e96ed -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints all
 ow`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=eaec642dc4bd613a -C extra-filename=-eaec642dc4bd613a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name hashbrown --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/hashbrown-0.11.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="raw"' -C metadata=d6e1633a7bf826d6 -C extra-filename=-d6e1633a7bf826d6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky
 -linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/byteorder/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=66cd7d61679bded3 -C extra-filename=-66cd7d61679bded3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/byteorder-66cd7d61679bded3 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name same_file --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/same-file/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=615d1abc5c1fcf5f -C extra-filename=-615d1abc5c1fcf5f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `matches` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name version_check /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/version_check-0.9.3/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=e813155548dc5b00 -C extra-filename=-e813155548dc5b00 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name remove_dir_all /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/remove_dir_all/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=81778ea11a419fef -C extra-filename=-81778ea11a419fef --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name fnv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/fnv/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=663a85e922c67990 -C extra-filename=-663a85e922c67990 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo
 /1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/semver-1.0.3/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="serde"' --cfg 'feature="std"' -C metadata=68ad495f8520f732 -C extra-filename=-68ad495f8520f732 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/semver-68ad495f8520f732 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name termcolor --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/termcolor/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4ea5a1ff7d9838e3 -C extra-filename=-4ea5a1ff7d9838e3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name utf8parse /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/utf8parse/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d00f5561878f6567 -C extra-filename=-d00f5561878f6567 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=379ae072c0f9335e -C extra-filename=-379ae072c0f9335e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name either /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/either-1.6.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4845b6dccc565436 -C extra-filename=-4845b6dccc565436 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name hex /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/hex-0.3.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=10e93aa2c9438aa4 -C extra-filename=-10e93aa2c9438aa4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name hex --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/hex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=a63d5a1cde7dce26 -C extra-filename=-a63d5a1cde7dce26 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-
 32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name smallvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/smallvec-1.7.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="may_dangle"' --cfg 'feature="union"' -C metadata=0fef2638061246ad -C extra-filename=-0fef2638061246ad --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name shell_escape /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/shell-escape/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=13a6a7d877a3064b -C extra-filename=-13a6a7d877a3064b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name textwrap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/textwrap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a800b29e33890cd4 -C extra-filename=-a800b29e33890cd4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/ta
 rget/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name humantime --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/humantime/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=df585607570a3e49 -C extra-filename=-df585607570a3e49 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name strsim /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/strsim/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=0aac8a4a71ccd55b -C extra-filename=-0aac8a4a71ccd55b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|    Compiling home v0.5.3
|    Compiling bytesize v1.0.1
|    Compiling glob v0.3.0
|      Running `rustc --crate-name lazycell /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/lazycell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=52626c4239ca1c57 -C extra-filename=-52626c4239ca1c57 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `lazy_static` (lib) generated 2 warnings (2 duplicates)
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name home --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/home/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c1f87d091ad7570c -C extra-filename=-c1f87d091ad7570c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/rel
 ease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name bytesize /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/bytesize/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d5389d800f541ea6 -C extra-filename=-d5389d800f541ea6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|    Compiling unicode-width v0.1.8
|    Compiling unicode-bidi v0.3.4
|    Compiling foreign-types v0.3.2
|      Running `rustc --crate-name glob /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/glob/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d3cb4ef7dc439063 -C extra-filename=-d3cb4ef7dc439063 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap
 -lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `foreign-types-shared` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name unicode_width /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/unicode-width/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=7de6775a7b7190ea -C extra-filename=-7de6775a7b7190ea --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/car
 go/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `remove_dir_all` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name unicode_bidi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/unicode-bidi-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=ee455bf9cad83a5f -C extra-filename=-ee455bf9cad83a5f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /cargo/1.60.0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libmatches-b68992495516de2b.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name foreign_types /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/foreign-types/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=f8a48c9aefd3cd98 -C extra-filename=-f8a48c9aefd3cd98 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/
 release/deps --extern foreign_types_shared=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libforeign_types_shared-8fc5c57fa84b14ba.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|     Building [>                          ] 9/193: strsim, smallvec, fnv, re...
| warning: `fnv` (lib) generated 2 warnings (2 duplicates)
|     Building [>                         ] 10/193: strsim, smallvec, regex-s...
| warning: `foreign-types` (lib) generated 2 warnings (2 duplicates)
|    Compiling vte v0.3.3
|     Building [>                         ] 11/193: strsim, smallvec, regex-s...
|      Running `rustc --crate-name vte /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/vte/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=945a3faeb00cb7ee -C extra-filename=-945a3faeb00cb7ee --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --exter
 n utf8parse=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libutf8parse-d00f5561878f6567.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `utf8parse` (lib) generated 2 warnings (2 duplicates)
|    Compiling form_urlencoded v1.0.1
|     Building [>                         ] 12/193: strsim, smallvec, regex-s...
|      Running `rustc --crate-name form_urlencoded --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/form_urlencoded/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=44e5599920f690fd -C extra-filename=-44e5599920f690fd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60
 .0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libmatches-b68992495516de2b.rmeta --extern percent_encoding=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libpercent_encoding-380d06c9601be706.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `lazycell` (lib) generated 2 warnings (2 duplicates)
|    Compiling walkdir v2.3.1
|     Building [>                         ] 13/193: strsim, smallvec, regex-s...
|      Running `rustc --crate-name walkdir --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/walkdir-2.3.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=64c69649462a9329 -C extra-filename=-64c69649462a9329 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/buil
 d/target/release/deps --extern same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libsame_file-615d1abc5c1fcf5f.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|     Building [>                         ] 14/193: strsim, smallvec, regex-s...
| warning: `unicode-width` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 15/193: strsim, smallvec, regex-s...
| warning: `itoa` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 16/193: strsim, smallvec, regex-s...
| warning: `either` (lib) generated 2 warnings (2 duplicates)
|    Compiling itertools v0.10.1
|     Building [=>                        ] 17/193: strsim, smallvec, regex-s...
|      Running `rustc --crate-name itertools --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/itertools-0.10.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_alloc"' --cfg 'feature="use_std"' -C metadata=9a32e2cc2b5c3a5b -C extra-filename=-9a32e2cc2b5c3a5b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild
 /yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libeither-4845b6dccc565436.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|    Compiling thread_local v1.1.4
|     Building [=>                        ] 17/193: strsim, smallvec, thread_...
|    Compiling strip-ansi-escapes v0.1.0
|      Running `rustc --crate-name strip_ansi_escapes /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/strip-ansi-escapes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5e57f24b78b29687 -C extra-filename=-5e57f24b78b29687 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/bui
 ld/target/release/deps --extern vte=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libvte-945a3faeb00cb7ee.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name thread_local --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/thread_local/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=34d1eb15d5445b36 -C extra-filename=-34d1eb15d5445b36 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/
 build/target/release/deps --extern once_cell=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libonce_cell-60318161937ecfd3.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `vte` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 18/193: strsim, smallvec, thread_...
| warning: `same-file` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 19/193: strsim, smallvec, thread_...
| warning: `bytesize` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 20/193: strsim, smallvec, thread_...
| warning: `once_cell` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 21/193: strsim, smallvec, thread_...
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 22/193: strsim, smallvec, thread_...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/getrandom-95a3fd6e3b653e7b/build-script-build`
| warning: `curl` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 23/193: strsim, smallvec, thread_...
|     Building [==>                       ] 24/193: strsim, smallvec, thread_...
| warning: `home` (lib) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 25/193: strsim, smallvec, thread_...
| warning: `crossbeam-utils` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 26/193: strsim, smallvec, thread_...
| warning: `log` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 27/193: strsim, smallvec, thread_...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/crossbeam-utils-f686239c1b98207b/build-script-build`
| warning: `openssl` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 28/193: strsim, smallvec, thread_...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/log-1b10c698a9cc2495/build-script-build`
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 29/193: strsim, smallvec, thread_...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/getrandom-fc52d8ce22410bec/build-script-build`
|     Building [===>                      ] 30/193: strsim, smallvec, thread_...
|      Running `rustc --crate-name crossbeam_utils --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/crossbeam-utils-0.8.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=a44adad03a56c4f4 -C extra-filename=-a44adad03a56c4f4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release
 /deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-29fa95b255c53b46.rmeta --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/liblazy_static-ff72ab8946451d6b.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|     Building [===>                      ] 31/193: strsim, smallvec, thread_...
|      Running `rustc --crate-name log /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/log/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=b0ad077105aca28a -C extra-filename=-b0ad077105aca28a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/targe
 t/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-29fa95b255c53b46.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg atomic_cas --cfg has_atomics`
| warning: `strip-ansi-escapes` (lib) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 32/193: strsim, smallvec, thread_...
| warning: `memchr` (build script) generated 2 warnings (2 duplicates)
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/memchr-6b3ec43a6d9a9cb0/build-script-build`
|     Building [===>                      ] 34/193: strsim, smallvec, thread_...
|     Building [===>                      ] 35/193: strsim, smallvec, thread_...
|      Running `rustc --crate-name memchr --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/memchr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=e187ebb0ca7a2308 -C extra-filename=-e187ebb0ca7a2308 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg memchr_runtime_simd --cfg memchr_runtime_sse2 --cfg memchr_runtime_sse42 --cfg memchr_runtime_avx`
| warning: `serde_derive` (build script) generated 2 warnings (1 duplicate)
|     Building [===>                      ] 36/193: strsim, smallvec, thread_...
| warning: `percent-encoding` (lib) generated 2 warnings (2 duplicates)
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/serde_derive-ee131b2a4944cc28/build-script-build`
|     Building [===>                      ] 37/193: strsim, smallvec, thread_...
| warning: `smallvec` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 38/193: strsim, thread_local, reg...
|     Building [====>                     ] 39/193: strsim, thread_local, reg...
| warning: `bitflags` (build script) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 40/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/bitflags-9a9704b3d5d185d4/build-script-build`
| warning: `openssl-probe` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 41/193: strsim, thread_local, reg...
| warning: `serde_json` (build script) generated 2 warnings (2 duplicates)
|    Compiling unicode-normalization v0.1.13
|     Building [====>                     ] 42/193: strsim, thread_local, reg...
| warning: `crc32fast` (build script) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 43/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/serde_json-97d385e59c2f8c78/build-script-build`
|      Running `rustc --crate-name unicode_normalization --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/unicode-normalization-0.1.13/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=0b0fe5300faee195 -C extra-filename=-0b0fe5300faee195 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-w
 orker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern tinyvec=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libtinyvec-7f7e748cb20fa42e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `shell-escape` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 44/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/crc32fast-755dcb0dae2632e2/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/crc32fast-755dcb0dae2632e2/build-script-build`
|     Building [=====>                    ] 45/193: strsim, thread_local, reg...
|     Building [=====>                    ] 46/193: strsim, thread_local, reg...
|      Running `rustc --crate-name bitflags /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/bitflags-1.2.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=1e47f9ec202d41f4 -C extra-filename=-1e47f9ec202d41f4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg bitflags_const_fn`
| warning: `tinyvec` (lib) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 47/193: strsim, thread_local, reg...
| warning: `libc` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 48/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/libc-d037728999df84bc/build-script-build`
|     Building [=====>                    ] 49/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/libc-d037728999df84bc/build-script-build`
|     Building [=====>                    ] 50/193: strsim, thread_local, reg...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=a8c38a92a83090ad -C extra-filename=-a8c38a92a83090ad --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-4900f7cf59ef11c1.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg crc32fast_stdarchx86`
| warning: `ryu` (build script) generated 2 warnings (2 duplicates)
| warning: `syn` (build script) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=8b9fadbf9c017e21 -C extra-filename=-8b9fadbf9c017e21 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/r
 elease/deps/libcfg_if-7efe5c704a5b4c0c.rmeta --cap-lints allow --cfg crc32fast_stdarchx86`
|     Building [======>                   ] 52/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/syn-6a0f819028b1c653/build-script-build`
| warning: `proc-macro2` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 53/193: strsim, thread_local, reg...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/ryu-c5c5bd6e45ecc53f/build-script-build`
| warning: `regex-automata` (lib) generated 2 warnings (2 duplicates)
| warning: `semver` (build script) generated 2 warnings (2 duplicates)
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/syn-6a0f819028b1c653/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/proc-macro2-c7041dc8a252118e/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/proc-macro2-c7041dc8a252118e/build-script-build`
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/libc-0.2.116/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=d2149737eee1e377 -C extra-filename=-d2149737eee1e377 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc
 _align --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of`
| warning: `serde` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 58/193: libc, strsim, thread_loca...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/semver-68ad495f8520f732/build-script-build`
|     Building [======>                   ] 59/193: libc, strsim, thread_loca...
| warning: `bitflags` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/libc-0.2.116/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=b5c6f9f754570794 -C extra-filename=-b5c6f9f754570794 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/bu
 ild/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of`
|     Building [=======>                  ] 62/193: libc, strsim, thread_loca...
|      Running `rustc --crate-name ryu --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/ryu-1.0.5/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=00bb36583e45bfad -C extra-filename=-00bb36583e45bfad --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target
 /release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg integer128 --cfg maybe_uninit`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/serde-78961b5ccb83a023/build-script-build`
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=85bd5a2e99bc024c -C extra-filename=-85bd5a2e99bc024c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/cargo/1.60.0-r0/build/target/release/deps/libunicode_xid-3f9e964215576218.rmeta --cap-lints allow --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [=======>                  ] 63/193: libc, strsim, thread_loca...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=ab4e3de8a9f45def -C extra-filename=-ab4e3de8a9f45def --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-eaec642dc4bd613a.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [=======>                  ] 64/193: libc, strsim, thread_loca...
| warning: `autocfg` (lib) generated 2 warnings (2 duplicates)
|    Compiling indexmap v1.8.0
|     Building [=======>                  ] 65/193: libc, strsim, thread_loca...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/indexmap/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=c69f29aba0cbf335 -C extra-filename=-c69f29aba0cbf335 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/indexmap-c69f29aba0cbf335 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern autocfg=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/
 target/release/deps/libautocfg-a666cdefedf9bb83.rlib --cap-lints allow`
|     Building [=======>                  ] 66/193: libc, strsim, thread_loca...
| warning: `anyhow` (build script) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 68/193: libc, strsim, thread_loca...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/anyhow-8015a808b39c99a1/build-script-build`
| warning: `ppv-lite86` (lib) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 69/193: libc, strsim, thread_loca...
| warning: `byteorder` (build script) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 70/193: libc, strsim, thread_loca...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/byteorder-66cd7d61679bded3/build-script-build`
| error[E0463]: can't find crate for `proc_macro`
|    --> /usr/src/debug/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/proc-macro2-1.0.30/src/lib.rs:102:1
|     |
| 102 | extern crate proc_macro;
|     | ^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
| 
| warning: `form_urlencoded` (lib) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 71/193: libc, strsim, thread_loca...
| warning: `version_check` (lib) generated 2 warnings (2 duplicates)
|    Compiling im-rc v15.0.0
|     Building [========>                 ] 72/193: libc, strsim, thread_loca...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/im-rc/./build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=066fdb9c891d98e4 -C extra-filename=-066fdb9c891d98e4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/im-rc-066fdb9c891d98e4 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps/
 libversion_check-e813155548dc5b00.rlib --cap-lints allow`
|     Building [========>                 ] 73/193: libc, strsim, thread_loca...
|      Running `rustc --crate-name byteorder /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/byteorder/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=290629f661eb93c6 -C extra-filename=-290629f661eb93c6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg byteorder_i128`
|     Building [========>                 ] 74/193: libc, strsim, thread_loca...
|      Running `rustc --crate-name anyhow --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/anyhow-1.0.51/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=09a02b10607afeab -C extra-filename=-09a02b10607afeab --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg backtrace`
| warning: `pkg-config` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 75/193: libc, strsim, thread_loca...
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 76/193: libc, strsim, thread_loca...
| warning: `humantime` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 77/193: libc, strsim, thread_loca...
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 78/193: libc, strsim, thread_loca...
| warning: `thread_local` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 79/193: libc, strsim, regex-synta...
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 80/193: libc, strsim, regex-synta...
| warning: `indexmap` (build script) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 81/193: libc, strsim, regex-synta...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/indexmap-c69f29aba0cbf335/build-script-build`
| warning: `typenum` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 82/193: libc, strsim, regex-synta...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/typenum-3e1dc6e6a667c567/build-script-main`
|    Compiling bstr v0.2.13
|    Compiling aho-corasick v0.7.18
|    Compiling os_str_bytes v6.0.0
|    Compiling combine v4.6.3
|      Running `rustc --crate-name bstr /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/bstr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="regex-automata"' --cfg 'feature="std"' --cfg 'feature="unicode"' -C metadata=67a1e7ba4fd5deff -C extra-filename=-67a1e7ba4fd5deff --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L d
 ependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/liblazy_static-ff72ab8946451d6b.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e187ebb0ca7a2308.rmeta --extern regex_automata=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libregex_automata-d2ca31bc372c9b31.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/ca
 rgo/1.60.0-r0`
|      Running `rustc --crate-name aho_corasick --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/aho-corasick/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=603e98512388496b -C extra-filename=-603e98512388496b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e187ebb0ca7a2308.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|      Running `rustc --crate-name os_str_bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/os_str_bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="memchr"' --cfg 'feature="raw_os_str"' -C metadata=cfeeb06c7b273864 -C extra-filename=-cfeeb06c7b273864 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e187ebb0ca7a2308.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|     Building [==========>               ] 82/193: libc, strsim, aho-corasic...
|      Running `rustc --crate-name combine --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/combine/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="bytes"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=6ab7a2038bf45795 -C extra-filename=-6ab7a2038bf45795 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/poky
 build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern bytes=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libbytes-379ae072c0f9335e.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e187ebb0ca7a2308.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
|     Building [==========>               ] 83/193: libc, strsim, aho-corasic...
|      Running `rustc --crate-name indexmap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/indexmap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=6d105da5d546b068 -C extra-filename=-6d105da5d546b068 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ca
 rgo/1.60.0-r0/build/target/release/deps --extern hashbrown=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libhashbrown-d6e1633a7bf826d6.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg has_std --cfg rustc_1_51`
| warning: `ryu` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 84/193: libc, strsim, aho-corasic...
| warning: `hashbrown` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 85/193: libc, strsim, aho-corasic...
|     Building [==========>               ] 86/193: libc, strsim, aho-corasic...
|      Running `rustc --crate-name typenum /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/typenum/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c6341ff09d3ae19b -C extra-filename=-c6341ff09d3ae19b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps
  --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0`
| warning: `im-rc` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 87/193: libc, strsim, aho-corasic...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/build/im-rc-066fdb9c891d98e4/build-script-build`
| warning: `log` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 88/193: libc, strsim, aho-corasic...
| warning: `textwrap` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 89/193: libc, strsim, aho-corasic...
|     Building [===========>              ] 90/193: libc, strsim, aho-corasic...
| For more information about this error, try `rustc --explain E0463`.
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
| error: could not compile `proc-macro2` due to previous error; 2 warnings emitted
| 
| Caused by:
|   process didn't exit successfully: `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=ab4e3de8a9f45def -C extra-filename=-ab4e3de8a9f45def --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybui
 ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-eaec642dc4bd613a.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0=/usr/src/debug/cargo/1.60.0-r0 --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [===========>              ] 91/193: libc, strsim, aho-corasic...
| warning: `termcolor` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 92/193: libc, strsim, aho-corasic...
| warning: `byteorder` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 93/193: libc, strsim, aho-corasic...
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 94/193: libc, strsim, aho-corasic...
| warning: `strsim` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 95/193: libc, aho-corasick, regex...
| warning: `walkdir` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 96/193: libc, aho-corasick, regex...
| warning: `unicode-bidi` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 97/193: libc, aho-corasick, regex...
| warning: `bytes` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 98/193: libc, aho-corasick, regex...
| warning: `crossbeam-utils` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 99/193: libc, aho-corasick, regex...
| warning: `os_str_bytes` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>             ] 100/193: libc, aho-corasick, regex...
| warning: `anyhow` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 101/193: libc, aho-corasick, regex...
| warning: `memchr` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 102/193: libc, aho-corasick, regex...
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 103/193: libc, aho-corasick, regex...
| warning: `glob` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 104/193: libc, aho-corasick, regex...
| warning: `indexmap` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 105/193: libc, aho-corasick, regex...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 106/193: aho-corasick, regex-synta...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 107/193: aho-corasick, regex-synta...
| warning: `unicode-normalization` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 108/193: aho-corasick, regex-synta...
| warning: `typenum` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 109/193: aho-corasick, regex-synta...
| warning: `bstr` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 110/193: aho-corasick, regex-synta...
| warning: `aho-corasick` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 111/193: regex-syntax, itertools, ...
| warning: `itertools` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 112/193: regex-syntax, combine
| warning: `regex-syntax` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 113/193: combine
| warning: `combine` (lib) generated 2 warnings (2 duplicates)
| error: build failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/run.do_compile.1051469:176 exit 101 from '"cargo" build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/rustc-1.60.0-src/src/tools/cargo//Cargo.toml "$@"'
| WARNING: Backtrace (BB generated script):
| 	#1: oe_cargo_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/run.do_compile.1051469, line 176
| 	#2: cargo_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/run.do_compile.1051469, line 166
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/run.do_compile.1051469, line 160
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/run.do_compile.1051469, line 208
NOTE: recipe cargo-1.60.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 849 tasks of which 716 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cargo-1.60.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/run.do_compile.1051469', 101, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.60.0-r0/temp/log.do_compile.1051469
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.60.0.bb:do_compile) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8848525150755325176==--

