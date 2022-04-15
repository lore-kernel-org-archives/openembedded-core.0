Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC400C352A1
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.11582.1650052686607942023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NFaQ3V+2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecde1ce-ba0864af-f4ee-4feb-8985-9c4fb197b60f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=St1KtY84K/RIlCaNncNlz77yTAaxnR+QjjlOujWZOjI=;
	b=NFaQ3V+2BQOOzia+l9+o6i0cvMR89DI/3uTc2qEmNh5zPNC2k5pME11r5Nu9wweu
	Ac5butuUS2NpG69QkmYr0DvLjGZaOkRZ03wkSjAEgn7TBwHstgeJAKIT0hmVR3QaWvA
	vDqssiNLjCkqCsm8RugmMVHbTzm1b3FkIM5oH8X4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=St1KtY84K/RIlCaNncNlz77yTAaxnR+QjjlOujWZOjI=;
	b=eiRtZUTXLDGa5KZXdXxxKTIOCGeikSS172hVF7u6EGaNYGiQBECXIu0G78ebhveJ
	qVsaxbbqlX7Igs3Sbh0zqiZjpfeM0hIe1n7OD3f/DOYludNt4zeXh2dZgWPS5vSlFUJ
	4FPufIMUKEUIWkaCIq2rkSWjHXaDQZCj5TLK7ejw=
Content-Type: multipart/mixed; boundary="===============5639222151902172236=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.60.0 FAILED
Message-ID: 
 <010101802ecde1ce-ba0864af-f4ee-4feb-8985-9c4fb197b60f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164449

--===============5639222151902172236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.60.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 38 recipes from the core2-32 sysroot...done.
Removing 45 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d81813087d51b070aba4bafcd6f4a4aa223a4c9e"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 83 Local 55 Mirrors 0 Missed 28 Current 130 (66% match, 86% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 145 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 146 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 461 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_fetch)
NOTE: Running task 539 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_fetch)
NOTE: Running task 588 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 589 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_fetch)
NOTE: Running task 590 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 591 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 592 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_fetch)
NOTE: Running task 593 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_fetch)
NOTE: Running task 598 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_fetch)
NOTE: Running task 612 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_fetch: Started
NOTE: recipe rust-native-1.59.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_fetch: Started
NOTE: recipe cargo-1.59.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_fetch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Succeeded
NOTE: Running task 615 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 616 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 167 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 168 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 170 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 171 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 172 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Succeeded
NOTE: Running task 621 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 178 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 182 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 187 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 188 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Succeeded
NOTE: Running task 642 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 190 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 193 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 647 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 195 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Succeeded
NOTE: Running task 648 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Started
NOTE: Running setscene task 197 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 199 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 200 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Succeeded
NOTE: Running task 653 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe glibc-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Started
NOTE: recipe glibc-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 206 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 210 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 666 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 667 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 668 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 211 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 679 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 680 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.59.0-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Succeeded
NOTE: Running task 681 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_unpack)
NOTE: Running task 682 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_unpack)
NOTE: Running task 683 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: Running task 684 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_unpack)
NOTE: Running task 685 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.59.0-r0: task do_unpack: Started
NOTE: Running task 686 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 687 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 757 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 789 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 790 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe cargo-1.59.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.59.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.59.0-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_unpack)
NOTE: Running task 792 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_unpack)
NOTE: Running task 793 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_unpack)
NOTE: recipe rust-native-1.59.0-r0: task do_unpack: Started
NOTE: recipe cargo-1.59.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 794 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_unpack: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Started
NOTE: Running task 795 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_patch)
NOTE: Running task 796 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_rust_setup_snapshot)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_patch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 797 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 798 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_rust_gen_targets)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 799 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 800 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 801 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 802 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 803 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 804 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 805 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 806 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 807 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 808 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_unpack: Succeeded
NOTE: Running task 809 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 810 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_generate_toolchain_file)
NOTE: Running task 811 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 812 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_configure)
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_patch)
NOTE: recipe libstd-rs-1.59.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 814 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 815 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_compile)
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_compile: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_patch)
NOTE: Running task 817 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-native-1.59.0-r0: task do_patch: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 818 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cargo-native-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-native-1.59.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe cargo-1.59.0-r0: task do_unpack: Succeeded
NOTE: Running task 819 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_patch)
NOTE: Running task 820 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-1.59.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-1.59.0-r0: task do_patch: Started
NOTE: recipe cargo-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 821 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 822 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_populate_lic)
NOTE: recipe cargo-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-1.59.0-r0: task do_populate_lic: Started
NOTE: recipe cargo-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.59.0-r0: task do_populate_lic: Succeeded
NOTE: recipe cargo-1.59.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe rust-native-1.59.0-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_patch)
NOTE: Running task 824 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.59.0-r0: task do_patch: Started
NOTE: recipe rust-native-1.59.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.59.0-r0: task do_patch: Succeeded
NOTE: Running task 825 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 826 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.59.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.59.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.59.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.59.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.59.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_compile: Succeeded
NOTE: Running task 827 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_install)
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_install: Succeeded
NOTE: Running task 828 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.59.0.bb:do_populate_sysroot)
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.59.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 829 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 830 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-native-1.59.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.59.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 831 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_configure)
NOTE: recipe rust-native-1.59.0-r0: task do_configure: Started
NOTE: recipe rust-native-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 832 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_compile)
NOTE: recipe rust-native-1.59.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_compile
NOTE: recipe rust-native-1.59.0-r0: task do_compile: Succeeded
NOTE: Running task 833 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_install)
NOTE: recipe rust-native-1.59.0-r0: task do_install: Started
NOTE: recipe rust-native-1.59.0-r0: task do_install: Succeeded
NOTE: Running task 834 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.59.0.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.59.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-native-1.59.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 835 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 836 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 837 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 838 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.59.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 839 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_configure)
NOTE: Running task 840 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_configure)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_configure: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_configure: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 841 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_compile)
NOTE: recipe cargo-native-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 842 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_compile)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_compile: Succeeded
NOTE: Running task 843 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_install)
NOTE: recipe cargo-native-1.59.0-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_install: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_install: Succeeded
NOTE: Running task 844 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_populate_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.59.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cargo-native-1.59.0-r0: task do_compile: Succeeded
NOTE: Running task 845 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_install)
NOTE: recipe cargo-native-1.59.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_install: Succeeded
NOTE: Running task 846 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.59.0-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.59.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 847 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 848 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.59.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 849 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_configure)
NOTE: recipe libstd-rs-1.59.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 850 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_compile)
NOTE: recipe libstd-rs-1.59.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_compile: Succeeded
NOTE: Running task 851 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_install)
NOTE: recipe libstd-rs-1.59.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_install: Succeeded
NOTE: Running task 852 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_populate_sysroot)
NOTE: Running task 853 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_package)
NOTE: recipe libstd-rs-1.59.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 854 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-1.59.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-1.59.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 855 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-1.59.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-1.59.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 856 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_configure)
NOTE: recipe cargo-1.59.0-r0: task do_configure: Started
NOTE: recipe cargo-1.59.0-r0: task do_configure: Succeeded
NOTE: Running task 857 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_compile)
NOTE: recipe cargo-1.59.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_package: Succeeded
NOTE: Running task 858 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.59.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: cargo = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot-native/usr/bin/cargo
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
| NOTE: cargo build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/src/tools/cargo//Cargo.toml
|    Compiling libc v0.2.108
|    Compiling pkg-config v0.3.18
|    Compiling autocfg v1.0.0
|    Compiling proc-macro2 v1.0.30
|    Compiling syn v1.0.80
|    Compiling unicode-xid v0.2.2
|    Compiling cfg-if v1.0.0
|    Compiling serde_derive v1.0.125
|    Compiling serde v1.0.125
|    Compiling cfg-if v0.1.10
|    Compiling memchr v2.4.1
|    Compiling log v0.4.14
|    Compiling matches v0.1.8
|    Compiling crc32fast v1.2.0
|    Compiling bitflags v1.2.1
|    Compiling lazy_static v1.4.0
|    Compiling getrandom v0.2.0
|    Compiling tinyvec v0.3.4
|    Compiling ryu v1.0.5
|    Compiling getrandom v0.1.14
|    Compiling percent-encoding v2.1.0
|    Compiling serde_json v1.0.59
|    Compiling regex-automata v0.1.10
|    Compiling anyhow v1.0.51
|    Compiling typenum v1.12.0
|    Compiling itoa v0.4.6
|    Compiling regex-syntax v0.6.25
|    Compiling openssl-probe v0.1.2
|    Compiling ppv-lite86 v0.2.8
|    Compiling foreign-types-shared v0.1.1
|    Compiling openssl v0.10.35
|    Compiling curl v0.4.41
|    Compiling byteorder v1.3.4
|    Compiling version_check v0.9.3
|    Compiling once_cell v1.7.2
|    Compiling same-file v1.0.6
|    Compiling semver v1.0.3
|    Compiling utf8parse v0.1.1
|    Compiling unicode-width v0.1.8
|    Compiling hex v0.3.2
|    Compiling remove_dir_all v0.5.3
|    Compiling fnv v1.0.7
|    Compiling hex v0.4.2
|    Compiling humantime v2.0.1
|    Compiling smallvec v1.7.0
|    Compiling vec_map v0.8.2
|    Compiling termcolor v1.1.2
|    Compiling shell-escape v0.1.5
|    Compiling strsim v0.8.0
|    Compiling ansi_term v0.12.1
|    Compiling either v1.6.0
|    Compiling lazycell v1.3.0
|    Compiling home v0.5.3
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/libc-0.2.108/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=8ff8a86b184860a9 -C extra-filename=-8ff8a86b184860a9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/libc-8ff8a86b184860a9 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name pkg_config /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/pkg-config/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=0318ca1c3ac428c7 -C extra-filename=-0318ca1c3ac428c7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name autocfg /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/autocfg-1.0.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=a0505b4a7811c548 -C extra-filename=-a0505b4a7811c548 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/proc-macro2-1.0.30/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=da3c990f1ddffb07 -C extra-filename=-da3c990f1ddffb07 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/proc-macro2-da3c990f1ddffb07 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/syn-1.0.80/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="extra-traits"' --cfg 'feature="fold"' --cfg 'feature="full"' --cfg 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"' --cfg 'feature="quote"' --cfg 'feature="visit"' --cfg 'feature="visit-mut"' -C metadata=47d2996637faf1ce -C extra-filename=-47d2996637faf1ce --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/syn-47d2996637faf1ce -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r
 0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=d137952d6cc7211f -C extra-filename=-d137952d6cc7211f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=00ce442bd5f3d4cb -C extra-filename=-00ce442bd5f3d4cb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target
 /release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/serde_derive-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=bdc276c90021309d -C extra-filename=-bdc276c90021309d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/serde_derive-bdc276c90021309d -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/serde-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"' --cfg 'feature="std"' -C metadata=e7f6212406647ffd -C extra-filename=-e7f6212406647ffd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/serde-e7f6212406647ffd -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8bf91e039c17bcf9 -C extra-filename=-8bf91e039c17bcf9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/memchr/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=7cdc87f689e1c5cd -C extra-filename=-7cdc87f689e1c5cd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/memchr-7cdc87f689e1c5cd -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/log/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=4b54aedcba72f6cf -C extra-filename=-4b54aedcba72f6cf --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/log-4b54aedcba72f6cf -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name matches /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/matches-0.1.8/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4a211ebfdc3da279 -C extra-filename=-4a211ebfdc3da279 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/crc32fast-1.2.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=323a701af6653ffc -C extra-filename=-323a701af6653ffc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/crc32fast-323a701af6653ffc -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/bitflags-1.2.1/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=3acf062e32baffee -C extra-filename=-3acf062e32baffee --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/bitflags-3acf062e32baffee -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name lazy_static /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/lazy_static/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d4106b6d3be57518 -C extra-filename=-d4106b6d3be57518 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/rele
 ase/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/getrandom/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=24c9040096dda431 -C extra-filename=-24c9040096dda431 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/getrandom-24c9040096dda431 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name tinyvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/tinyvec-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' -C metadata=25dd19f112e830f8 -C extra-filename=-25dd19f112e830f8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/ryu-1.0.5/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=d48c953241b81eb4 -C extra-filename=-d48c953241b81eb4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/ryu-d48c953241b81eb4 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/getrandom-0.1.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=42cb8a2607298aa0 -C extra-filename=-42cb8a2607298aa0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/getrandom-42cb8a2607298aa0 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name percent_encoding /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/percent-encoding/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=013b63ecbf446638 -C extra-filename=-013b63ecbf446638 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/serde_json-1.0.59/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="raw_value"' --cfg 'feature="std"' --cfg 'feature="unbounded_depth"' -C metadata=dad4fd4c2dd3a75f -C extra-filename=-dad4fd4c2dd3a75f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/serde_json-dad4fd4c2dd3a75f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
| warning: target json file contains unused fields: has-elf-tls
| 
|      Running `rustc --crate-name regex_automata /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/regex-automata/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=1fcaae78fd09a620 -C extra-filename=-1fcaae78fd09a620 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/anyhow/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=9a394461edde0fed -C extra-filename=-9a394461edde0fed --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/anyhow-9a394461edde0fed -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_main /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/typenum/build/main.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c122ec49d2282f0a -C extra-filename=-c122ec49d2282f0a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/typenum-c122ec49d2282f0a -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name itoa /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/itoa-0.4.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4c9fde48edf21c75 -C extra-filename=-4c9fde48edf21c75 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps
  --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=1c114a14cfc072c6 -C extra-filename=-1c114a14cfc072c6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name regex_syntax --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/regex-syntax/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="unicode"' --cfg 'feature="unicode-age"' --cfg 'feature="unicode-bool"' --cfg 'feature="unicode-case"' --cfg 'feature="unicode-gencat"' --cfg 'feature="unicode-perl"' --cfg 'feature="unicode-script"' --cfg 'feature="unicode-segment"' -C metadata=c22427a2bd14d231 -C extra-filename=-c22427a2bd14d231 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/targ
 et-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name openssl_probe /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/openssl-probe/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3cd8d7880b8e8a23 -C extra-filename=-3cd8d7880b8e8a23 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/
 release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=b4683b16a77e6132 -C extra-filename=-b4683b16a77e6132 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name ppv_lite86 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/ppv-lite86/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="simd"' --cfg 'feature="std"' -C metadata=8d0e6a7e441f3677 -C extra-filename=-8d0e6a7e441f3677 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=f3a7e450a0c1562f -C extra-filename=-f3a7e450a0c1562f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name foreign_types_shared /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/foreign-types-shared/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=695adcef48af67ca -C extra-filename=-695adcef48af67ca --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/openssl/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=237b0bc249f1fe9c -C extra-filename=-237b0bc249f1fe9c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/openssl-237b0bc249f1fe9c -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/curl/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="http2"' --cfg 'feature="openssl-probe"' --cfg 'feature="openssl-sys"' --cfg 'feature="ssl"' -C metadata=a837c575358a4ddc -C extra-filename=-a837c575358a4ddc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/curl-a837c575358a4ddc -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/byteorder/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=d0b8278840bf8290 -C extra-filename=-d0b8278840bf8290 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/byteorder-d0b8278840bf8290 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name version_check /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/version_check/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=fab7a35766a68c0e -C extra-filename=-fab7a35766a68c0e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name once_cell --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/once_cell-1.7.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' --cfg 'feature="race"' --cfg 'feature="std"' -C metadata=a640ba3f592a2e63 -C extra-filename=-a640ba3f592a2e63 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `cfg-if` (lib) generated 2 warnings (1 duplicate)
|      Running `rustc --crate-name same_file --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/same-file/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=88a9aba92273165e -C extra-filename=-88a9aba92273165e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/semver-1.0.3/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="serde"' --cfg 'feature="std"' -C metadata=c2ad83a7ba20fc0a -C extra-filename=-c2ad83a7ba20fc0a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/semver-c2ad83a7ba20fc0a -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name utf8parse /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/utf8parse/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d342bac240b2b734 -C extra-filename=-d342bac240b2b734 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `matches` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name unicode_width /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/unicode-width/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=91853f2609476b47 -C extra-filename=-91853f2609476b47 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/car
 go/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name hex /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/hex-0.3.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5ad6e10f2b97ad2a -C extra-filename=-5ad6e10f2b97ad2a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name remove_dir_all /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/remove_dir_all/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c1dc3f99c9ab9961 -C extra-filename=-c1dc3f99c9ab9961 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name fnv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/fnv/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=64b9dcd145ec3f82 -C extra-filename=-64b9dcd145ec3f82 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo
 /1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name hex --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/hex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=ee41f4c98fd88761 -C extra-filename=-ee41f4c98fd88761 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-
 32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name humantime --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/humantime/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3f8216d8b6647969 -C extra-filename=-3f8216d8b6647969 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name smallvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/smallvec/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="may_dangle"' --cfg 'feature="union"' -C metadata=6ac6151cc9a69f16 -C extra-filename=-6ac6151cc9a69f16 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name vec_map /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/vec_map/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=06517366810decd8 -C extra-filename=-06517366810decd8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps
  --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name termcolor --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/termcolor/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=f249f8cf68499598 -C extra-filename=-f249f8cf68499598 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name shell_escape /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/shell-escape/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=56d2302448bcff3c -C extra-filename=-56d2302448bcff3c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name strsim /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/strsim/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a8f045cd43a7cb2f -C extra-filename=-a8f045cd43a7cb2f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name ansi_term /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/ansi_term/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a4c40dcbe55e103f -C extra-filename=-a4c40dcbe55e103f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name either /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/either-1.6.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6330af3f86930629 -C extra-filename=-6330af3f86930629 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `lazy_static` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name lazycell /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/lazycell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=69b59baee91b071b -C extra-filename=-69b59baee91b071b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|    Compiling bytesize v1.0.1
|    Compiling glob v0.3.0
|    Compiling unicode-bidi v0.3.4
|    Compiling thread_local v1.0.1
|      Running `rustc --crate-name home --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/home/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c860887d092b65f8 -C extra-filename=-c860887d092b65f8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/rel
 ease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
| warning: `foreign-types-shared` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name bytesize /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/bytesize/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6fbc7810fb9e6d26 -C extra-filename=-6fbc7810fb9e6d26 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name glob /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/glob/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=2495f19aba3921b9 -C extra-filename=-2495f19aba3921b9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap
 -lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|    Compiling foreign-types v0.3.2
|      Running `rustc --crate-name unicode_bidi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/unicode-bidi-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=0288bd39446f18c6 -C extra-filename=-0288bd39446f18c6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /cargo/1.59.0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libmatches-4a211ebfdc3da279.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `rustc --crate-name thread_local /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/thread_local-1.0.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=95447e04963c944f -C extra-filename=-95447e04963c944f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/tar
 get/release/deps --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/liblazy_static-d4106b6d3be57518.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `remove_dir_all` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name foreign_types /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/foreign-types/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=56eea3b8350f7941 -C extra-filename=-56eea3b8350f7941 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/
 release/deps --extern foreign_types_shared=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libforeign_types_shared-695adcef48af67ca.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|     Building [>                          ] 8/187: byteorder(build.rs), serd...
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|     Building [>                          ] 9/187: byteorder(build.rs), serd...
| warning: `fnv` (lib) generated 2 warnings (2 duplicates)
|    Compiling vte v0.3.3
|     Building [>                         ] 10/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name vte /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/vte/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e74581cecc001ed4 -C extra-filename=-e74581cecc001ed4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --exter
 n utf8parse=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libutf8parse-d342bac240b2b734.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `foreign-types` (lib) generated 2 warnings (2 duplicates)
|    Compiling form_urlencoded v1.0.1
|     Building [>                         ] 11/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name form_urlencoded --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/form_urlencoded/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=75bfcf6423b6d902 -C extra-filename=-75bfcf6423b6d902 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59
 .0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libmatches-4a211ebfdc3da279.rmeta --extern percent_encoding=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libpercent_encoding-013b63ecbf446638.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `unicode-width` (lib) generated 2 warnings (2 duplicates)
|    Compiling walkdir v2.3.1
|     Building [>                         ] 12/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name walkdir --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/walkdir-2.3.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6aeaf7f53c446572 -C extra-filename=-6aeaf7f53c446572 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/buil
 d/target/release/deps --extern same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libsame_file-88a9aba92273165e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|    Compiling textwrap v0.11.0
|     Building [>                         ] 13/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name textwrap /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/textwrap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=0234970769a74196 -C extra-filename=-0234970769a74196 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/de
 ps --extern unicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libunicode_width-91853f2609476b47.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `utf8parse` (lib) generated 2 warnings (2 duplicates)
|     Building [>                         ] 14/187: byteorder(build.rs), serd...
| warning: `lazycell` (lib) generated 2 warnings (2 duplicates)
| warning: `itoa` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 16/187: byteorder(build.rs), serd...
| warning: `either` (lib) generated 2 warnings (2 duplicates)
|    Compiling itertools v0.10.1
|     Building [=>                        ] 17/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name itertools --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/itertools-0.10.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_alloc"' --cfg 'feature="use_std"' -C metadata=e742d73ef4ddcd8b -C extra-filename=-e742d73ef4ddcd8b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild
 /yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libeither-6330af3f86930629.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `vte` (lib) generated 2 warnings (2 duplicates)
|    Compiling strip-ansi-escapes v0.1.0
| warning: `bytesize` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 19/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name strip_ansi_escapes /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/strip-ansi-escapes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=876717f34698a306 -C extra-filename=-876717f34698a306 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/bui
 ld/target/release/deps --extern vte=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libvte-e74581cecc001ed4.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `vec_map` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 20/187: byteorder(build.rs), serd...
| warning: `same-file` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 21/187: byteorder(build.rs), serd...
| warning: `openssl-probe` (lib) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 22/187: byteorder(build.rs), serd...
| warning: `log` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 23/187: byteorder(build.rs), serd...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/log-4b54aedcba72f6cf/build-script-build`
| warning: `memchr` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 24/187: byteorder(build.rs), serd...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/memchr-7cdc87f689e1c5cd/build-script-build`
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
| warning: `curl` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 26/187: byteorder(build.rs), serd...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/getrandom-42cb8a2607298aa0/build-script-build`
|     Building [==>                       ] 27/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name log /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/log/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=e2f687392695c839 -C extra-filename=-e2f687392695c839 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/targe
 t/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-00ce442bd5f3d4cb.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg atomic_cas --cfg has_atomics`
| warning: `once_cell` (lib) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 28/187: byteorder(build.rs), serd...
|     Building [===>                      ] 29/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name memchr --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/memchr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=a66876d062012308 -C extra-filename=-a66876d062012308 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg memchr_runtime_simd --cfg memchr_runtime_sse2 --cfg memchr_runtime_sse42 --cfg memchr_runtime_avx`
| warning: `strip-ansi-escapes` (lib) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 30/187: byteorder(build.rs), serd...
|     Building [===>                      ] 31/187: byteorder(build.rs), serd...
| warning: `crc32fast` (build script) generated 2 warnings (2 duplicates)
| warning: `serde_derive` (build script) generated 2 warnings (2 duplicates)
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/crc32fast-323a701af6653ffc/build-script-build`
| warning: `ryu` (build script) generated 2 warnings (2 duplicates)
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/serde_derive-bdc276c90021309d/build-script-build`
|     Building [===>                      ] 35/187: byteorder(build.rs), serd...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/getrandom-24c9040096dda431/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/crc32fast-323a701af6653ffc/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/ryu-d48c953241b81eb4/build-script-build`
| warning: `openssl` (build script) generated 2 warnings (2 duplicates)
| warning: `shell-escape` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 37/187: byteorder(build.rs), serd...
|     Building [====>                     ] 38/187: byteorder(build.rs), serd...
| warning: `percent-encoding` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 39/187: byteorder(build.rs), serd...
|     Building [====>                     ] 40/187: byteorder(build.rs), serd...
|     Building [====>                     ] 41/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=b04881c41ef124f8 -C extra-filename=-b04881c41ef124f8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/r
 elease/deps/libcfg_if-1c114a14cfc072c6.rmeta --cap-lints allow --cfg crc32fast_stdarchx86`
| warning: `home` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 42/187: byteorder(build.rs), serd...
|     Building [====>                     ] 43/187: byteorder(build.rs), serd...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=475b3f7dd8a5abf5 -C extra-filename=-475b3f7dd8a5abf5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-8bf91e039c17bcf9.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg crc32fast_stdarchx86`
| warning: `bitflags` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 44/187: byteorder(build.rs), serd...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/bitflags-3acf062e32baffee/build-script-build`
| warning: `serde_json` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 46/187: byteorder(build.rs), rege...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/serde_json-dad4fd4c2dd3a75f/build-script-build`
| warning: `smallvec` (lib) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 47/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name ryu --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/ryu-1.0.5/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5bebb553ee3b488f -C extra-filename=-5bebb553ee3b488f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target
 /release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg integer128 --cfg maybe_uninit`
|     Building [=====>                    ] 48/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name bitflags /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/bitflags-1.2.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=228ee49c484fd5dd -C extra-filename=-228ee49c484fd5dd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg bitflags_const_fn`
|     Building [=====>                    ] 49/187: byteorder(build.rs), rege...
| warning: `anyhow` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 50/187: byteorder(build.rs), rege...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/anyhow-9a394461edde0fed/build-script-build`
| warning: `semver` (build script) generated 2 warnings (2 duplicates)
|    Compiling unicode-normalization v0.1.13
|     Building [======>                   ] 51/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name unicode_normalization --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/unicode-normalization-0.1.13/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=d1da3a1d542a0955 -C extra-filename=-d1da3a1d542a0955 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-w
 orker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern tinyvec=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libtinyvec-25dd19f112e830f8.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/semver-c2ad83a7ba20fc0a/build-script-build`
| warning: `autocfg` (lib) generated 2 warnings (2 duplicates)
|    Compiling crossbeam-utils v0.8.3
| warning: `regex-automata` (lib) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 53/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/crossbeam-utils-0.8.3/build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=c943cc2a52a34488 -C extra-filename=-c943cc2a52a34488 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/crossbeam-utils-c943cc2a52a34488 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern autocfg=/home/poky
 build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps/libautocfg-a0505b4a7811c548.rlib --cap-lints allow`
| warning: `bitflags` (lib) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 54/187: byteorder(build.rs), rege...
| warning: `syn` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 55/187: byteorder(build.rs), rege...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/syn-47d2996637faf1ce/build-script-build`
| warning: `tinyvec` (lib) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 56/187: byteorder(build.rs), rege...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/syn-47d2996637faf1ce/build-script-build`
| warning: `version_check` (lib) generated 2 warnings (2 duplicates)
|    Compiling im-rc v15.0.0
|     Building [======>                   ] 57/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/im-rc/./build.rs --error-format=json --json=diagnostic-rendered-ansi,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=10bada0fe2acc6de -C extra-filename=-10bada0fe2acc6de --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/im-rc-10bada0fe2acc6de -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps/libversion
 _check-fab7a35766a68c0e.rlib --cap-lints allow`
|     Building [=======>                  ] 58/187: byteorder(build.rs), rege...
|     Building [=======>                  ] 59/187: byteorder(build.rs), rege...
|     Building [=======>                  ] 60/187: byteorder(build.rs), rege...
| warning: `libc` (build script) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 61/187: byteorder(build.rs), libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/libc-8ff8a86b184860a9/build-script-build`
| warning: `serde` (build script) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 62/187: byteorder(build.rs), libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/libc-8ff8a86b184860a9/build-script-build`
| warning: `ppv-lite86` (lib) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 63/187: byteorder(build.rs), libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/serde-e7f6212406647ffd/build-script-build`
| warning: `form_urlencoded` (lib) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 64/187: byteorder(build.rs), libc...
|     Building [========>                 ] 65/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/libc-0.2.108/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=582ae0cb7a61fe3c -C extra-filename=-582ae0cb7a61fe3c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc
 _align --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of`
|     Building [========>                 ] 66/187: byteorder(build.rs), rege...
| warning: `proc-macro2` (build script) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/libc-0.2.108/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=23189cbddf8fe387 -C extra-filename=-23189cbddf8fe387 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/bu
 ild/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of`
|     Building [========>                 ] 67/187: byteorder(build.rs), rege...
|     Building [========>                 ] 68/187: byteorder(build.rs), rege...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/proc-macro2-da3c990f1ddffb07/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/proc-macro2-da3c990f1ddffb07/build-script-build`
|     Building [========>                 ] 69/187: byteorder(build.rs), rege...
|      Running `rustc --crate-name anyhow --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/anyhow/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=c94ece1447dd4b5a -C extra-filename=-c94ece1447dd4b5a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg backtrace`
|     Building [========>                 ] 70/187: byteorder(build.rs), proc...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=8e0a977fc865b40b -C extra-filename=-8e0a977fc865b40b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-b4683b16a77e6132.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [========>                 ] 71/187: byteorder(build.rs), proc...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=5981a0dceb14a6ae -C extra-filename=-5981a0dceb14a6ae --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/cargo/1.59.0-r0/build/target/release/deps/libunicode_xid-d137952d6cc7211f.rmeta --cap-lints allow --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro`
| warning: `thread_local` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 72/187: byteorder(build.rs), proc...
| error[E0463]: can't find crate for `proc_macro`
|    --> /usr/src/debug/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/proc-macro2-1.0.30/src/lib.rs:102:1
|     |
| 102 | extern crate proc_macro;
|     | ^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
| 
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 73/187: byteorder(build.rs), proc...
| warning: `pkg-config` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 74/187: byteorder(build.rs), proc...
| warning: `ansi_term` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 75/187: byteorder(build.rs), proc...
| warning: `byteorder` (build script) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 76/187: byteorder(build), proc-ma...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/byteorder-d0b8278840bf8290/build-script-build`
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 77/187: byteorder(build), proc-ma...
|     Building [=========>                ] 78/187: proc-macro2, regex-syntax...
|      Running `rustc --crate-name byteorder /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/byteorder/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=b08aa1949fe7e4d6 -C extra-filename=-b08aa1949fe7e4d6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/cargo/1.59.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg byteorder_i128`
| warning: `humantime` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 79/187: proc-macro2, regex-syntax...
| warning: `textwrap` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 80/187: proc-macro2, regex-syntax...
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 81/187: proc-macro2, regex-syntax...
| warning: `crossbeam-utils` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 82/187: proc-macro2, regex-syntax...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/crossbeam-utils-c943cc2a52a34488/build-script-build`
|    Compiling bstr v0.2.13
|    Compiling aho-corasick v0.7.18
|     Building [==========>               ] 82/187: bstr, proc-macro2, regex-...
|      Running `rustc --crate-name bstr /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/bstr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="regex-automata"' --cfg 'feature="std"' --cfg 'feature="unicode"' -C metadata=378e3aecba2637e8 -C extra-filename=-378e3aecba2637e8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L d
 ependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/liblazy_static-d4106b6d3be57518.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-a66876d062012308.rmeta --extern regex_automata=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libregex_automata-1fcaae78fd09a620.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/ca
 rgo/1.59.0-r0`
|      Running `rustc --crate-name aho_corasick --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/aho-corasick/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=69af0da82c1bd3b7 -C extra-filename=-69af0da82c1bd3b7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-a66876d062012308.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| warning: `ryu` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 83/187: bstr, proc-macro2, regex-...
| warning: `im-rc` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 84/187: bstr, proc-macro2, regex-...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/im-rc-10bada0fe2acc6de/build-script-build`
|     Building [==========>               ] 85/187: bstr, proc-macro2, regex-...
| warning: `typenum` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 86/187: bstr, proc-macro2, regex-...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/build/typenum-c122ec49d2282f0a/build-script-main`
| warning: `log` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 87/187: bstr, proc-macro2, regex-...
|     Building [===========>              ] 88/187: bstr, proc-macro2, regex-...
|      Running `rustc --crate-name typenum /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/typenum/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ae2710228bf86b3b -C extra-filename=-ae2710228bf86b3b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps
  --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0`
| For more information about this error, try `rustc --explain E0463`.
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
| error: could not compile `proc-macro2` due to previous error; 2 warnings emitted
| 
| Caused by:
|   process didn't exit successfully: `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=8e0a977fc865b40b -C extra-filename=-8e0a977fc865b40b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybui
 ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-b4683b16a77e6132.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0=/usr/src/debug/cargo/1.59.0-r0 --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [===========>              ] 89/187: bstr, regex-syntax, hex, ...
| warning: `termcolor` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 90/187: bstr, regex-syntax, hex, ...
|     Building [===========>              ] 91/187: bstr, regex-syntax, hex, ...
| warning: `walkdir` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 92/187: bstr, regex-syntax, hex, ...
| warning: `strsim` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 93/187: bstr, regex-syntax, hex, ...
| warning: `byteorder` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 94/187: bstr, regex-syntax, hex, ...
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 95/187: bstr, regex-syntax, glob,...
| warning: `unicode-bidi` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 96/187: bstr, regex-syntax, glob,...
| warning: `anyhow` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 97/187: bstr, regex-syntax, glob,...
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 98/187: bstr, regex-syntax, glob,...
| warning: `memchr` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 99/187: bstr, regex-syntax, glob,...
| warning: `glob` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 100/187: bstr, regex-syntax, typen...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 101/187: bstr, regex-syntax, typen...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 102/187: bstr, regex-syntax, typen...
| warning: `unicode-normalization` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 103/187: bstr, regex-syntax, typen...
| warning: `typenum` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 104/187: bstr, regex-syntax, aho-c...
| warning: `bstr` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 105/187: regex-syntax, aho-corasic...
| warning: `aho-corasick` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 106/187: regex-syntax, itertools
| warning: `itertools` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 107/187: regex-syntax
| warning: `regex-syntax` (lib) generated 2 warnings (2 duplicates)
| error: build failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/run.do_compile.3091208:176 exit 101 from '"cargo" build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/rustc-1.59.0-src/src/tools/cargo//Cargo.toml "$@"'
| WARNING: Backtrace (BB generated script):
| 	#1: oe_cargo_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/run.do_compile.3091208, line 176
| 	#2: cargo_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/run.do_compile.3091208, line 166
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/run.do_compile.3091208, line 160
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/run.do_compile.3091208, line 208
NOTE: recipe cargo-1.59.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 858 tasks of which 758 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cargo-1.59.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/run.do_compile.3091208', 101, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.59.0-r0/temp/log.do_compile.3091208
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.59.0.bb:do_compile) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5639222151902172236==--

