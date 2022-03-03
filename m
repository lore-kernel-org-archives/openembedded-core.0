Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4631BC4167E
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.13893.1646329344367363646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=uVVftelp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101017f50e02e11-b76b0ec2-3552-4161-8b5b-f5527ecd535f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b+I8PuHNcQHWBvTdDl/Rz+AyHVWesZ/QxunAIecUQQ4=;
	b=uVVftelpCRxol046GnCkvdr8+cRlnFhxQ05Un6KBggy96CLgMR/jbt8bYaOLM3A/
	8eAOrmEug6I9wuVdOHLelYufmqy/3NvMfwI2N3zYTyupzV8vS4hpcSIOlJ49nPnJf7G
	uXWJKdrlYM2oVZ70DnP/mHp2NCBn2GZd85PEqXJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b+I8PuHNcQHWBvTdDl/Rz+AyHVWesZ/QxunAIecUQQ4=;
	b=DNIePeIb4SNFcpOk6Lze2pksTDmvAtbNy0AlPojT9gnDNNp8/KI+42acs3uFL7lv
	csEuS9Y5r4cqtJCGfnoUDF0Y1yuoVQS0GZ2ITuKZGqTvVzml+O4kZPpp/Y6tQ68pJ1z
	BVHVtrdHk6eHax8ydVzuIBElOwpH8GrUtWordmlg=
Content-Type: multipart/mixed; boundary="===============0110117904012676435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.59.0 FAILED
Message-ID: 
 <0101017f50e02e11-b76b0ec2-3552-4161-8b5b-f5527ecd535f-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162677

--===============0110117904012676435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.59.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 35 skipped, 0 masked, 0 errors.
Removing 31 recipes from the core2-32 sysroot...done.
Removing 30 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-32b93c61f7b993af40e3ca6c82bb82e732a7b460"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:32b93c61f7b993af40e3ca6c82bb82e732a7b460"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 46 Mirrors 0 Missed 35 Current 132 (56% match, 83% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 152 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 154 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 158 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 161 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 162 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 479 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_fetch)
NOTE: Running task 539 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_fetch)
NOTE: Running task 588 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 589 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_fetch)
NOTE: Running task 590 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 591 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 592 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_fetch)
NOTE: Running task 593 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_fetch)
NOTE: Running task 595 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 596 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_fetch)
NOTE: Running task 599 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_fetch)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.58.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_fetch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Started
NOTE: recipe cargo-1.58.1-r0: task do_fetch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_fetch: Started
NOTE: recipe curl-7.81.0-r0: task do_fetch: Succeeded
NOTE: Running task 606 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_unpack)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 177 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 180 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 183 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 619 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 620 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 621 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 622 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_unpack: Succeeded
NOTE: Running task 623 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 187 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 632 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_patch: Started
NOTE: recipe curl-7.81.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Succeeded
NOTE: Running task 633 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe curl-7.81.0-r0: task do_patch: Succeeded
NOTE: Running task 634 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 190 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 193 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.81.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 195 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 197 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 199 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 200 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_patch: Succeeded
NOTE: Running task 643 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Succeeded
NOTE: Running task 644 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 645 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: Running task 646 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 647 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 648 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: recipe ca-certificates-20211016-r0: task do_configure: Started
NOTE: recipe glibc-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 206 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.58.1-r0: task do_fetch: Succeeded
NOTE: Running task 655 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 656 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_unpack)
NOTE: Running task 657 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_unpack)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Started
NOTE: Running task 658 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_unpack)
NOTE: Running task 659 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-20211016-r0: task do_configure: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 660 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: Running task 661 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.58.1-r0: task do_unpack: Started
NOTE: Running task 662 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Started
NOTE: recipe ca-certificates-20211016-r0: task do_compile: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Succeeded
NOTE: Running task 663 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 664 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 665 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_compile: Succeeded
NOTE: Running task 666 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 667 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: Running task 668 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 210 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_install: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 211 of 213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_fetch: Succeeded
NOTE: recipe cargo-1.58.1-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.58.1-r0: task do_fetch: Succeeded
NOTE: Running task 685 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_unpack)
NOTE: Running task 686 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_unpack)
NOTE: Running task 687 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_unpack)
NOTE: recipe rust-native-1.58.1-r0: task do_unpack: Started
NOTE: recipe cargo-1.58.1-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20211016-r0: task do_install: Succeeded
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 757 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 774 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 779 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: Running task 784 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_package)
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe ca-certificates-20211016-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 785 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 786 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_configure)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe curl-7.81.0-r0: task do_configure: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Succeeded
NOTE: Running task 787 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_package: Succeeded
NOTE: Running task 788 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_patch)
NOTE: Running task 790 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_rust_setup_snapshot)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_patch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 791 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_patch: Succeeded
NOTE: Running task 792 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 793 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_rust_gen_targets)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 794 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 795 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 796 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 797 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 798 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 799 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 800 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 801 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 802 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libstd-rs-1.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_patch)
NOTE: recipe libstd-rs-1.58.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_patch: Succeeded
NOTE: Running task 804 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 805 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 806 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_patch)
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_patch: Succeeded
NOTE: Running task 807 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_generate_toolchain_file)
NOTE: Running task 808 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 809 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_configure)
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_configure: Started
NOTE: recipe curl-7.81.0-r0: task do_configure: Succeeded
NOTE: Running task 810 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_compile)
NOTE: recipe curl-7.81.0-r0: task do_compile: Started
NOTE: recipe curl-7.81.0-r0: task do_compile: Succeeded
NOTE: Running task 811 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_install)
NOTE: recipe curl-7.81.0-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_configure: Succeeded
NOTE: Running task 812 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_compile)
NOTE: recipe curl-7.81.0-r0: task do_install: Succeeded
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_compile: Started
NOTE: Running task 813 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_populate_sysroot)
NOTE: Running task 814 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_package)
NOTE: recipe curl-7.81.0-r0: task do_package: Started
NOTE: recipe curl-7.81.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.81.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rust-native-1.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_patch)
NOTE: Running task 816 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.58.1-r0: task do_patch: Started
NOTE: recipe rust-native-1.58.1-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.58.1-r0: task do_patch: Succeeded
NOTE: Running task 817 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 818 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.58.1-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.58.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.81.0-r0: task do_package: Succeeded
NOTE: Running task 819 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.81.0.bb:do_packagedata)
NOTE: recipe curl-7.81.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.81.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-native-1.58.1-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe cargo-native-1.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_patch)
NOTE: Running task 821 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-native-1.58.1-r0: task do_patch: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_patch: Succeeded
NOTE: Running task 822 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cargo-native-1.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-native-1.58.1-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe cargo-1.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_patch)
NOTE: Running task 824 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-1.58.1-r0: task do_patch: Started
NOTE: recipe cargo-1.58.1-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-1.58.1-r0: task do_patch: Succeeded
NOTE: Running task 825 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 826 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_populate_lic)
NOTE: recipe cargo-1.58.1-r0: task do_populate_lic: Started
NOTE: recipe cargo-1.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-1.58.1-r0: task do_populate_lic: Succeeded
NOTE: recipe cargo-1.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.58.1-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_compile: Succeeded
NOTE: Running task 827 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_install)
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_install: Succeeded
NOTE: Running task 828 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb:do_populate_sysroot)
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 829 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 830 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_rust_create_wrappers)
NOTE: recipe rust-native-1.58.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.58.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 831 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_configure)
NOTE: recipe rust-native-1.58.1-r0: task do_configure: Started
NOTE: recipe rust-native-1.58.1-r0: task do_configure: Succeeded
NOTE: Running task 832 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_compile)
NOTE: recipe rust-native-1.58.1-r0: task do_compile: Started
NOTE: recipe rust-native-1.58.1-r0: task do_compile: Succeeded
NOTE: Running task 833 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_install)
NOTE: recipe rust-native-1.58.1-r0: task do_install: Started
NOTE: recipe rust-native-1.58.1-r0: task do_install: Succeeded
NOTE: Running task 834 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.58.1.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe rust-native-1.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 835 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 836 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 837 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_rust_create_wrappers)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 838 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.58.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 839 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_configure)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 840 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_configure)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_configure: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_configure: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_configure: Succeeded
NOTE: Running task 841 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_compile)
NOTE: recipe cargo-native-1.58.1-r0: task do_configure: Succeeded
NOTE: Running task 842 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_compile)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_compile: Succeeded
NOTE: Running task 843 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_install)
NOTE: recipe cargo-native-1.58.1-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_install: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_install: Succeeded
NOTE: Running task 844 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.58.1.bb:do_populate_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cargo-native-1.58.1-r0: task do_compile: Succeeded
NOTE: Running task 845 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_install)
NOTE: recipe cargo-native-1.58.1-r0: task do_install: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_install: Succeeded
NOTE: Running task 846 of 865 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 847 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 848 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.58.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 849 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_configure)
NOTE: recipe libstd-rs-1.58.1-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_configure: Succeeded
NOTE: Running task 850 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_compile)
NOTE: recipe libstd-rs-1.58.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_compile: Succeeded
NOTE: Running task 851 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_install)
NOTE: recipe libstd-rs-1.58.1-r0: task do_install: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_install: Succeeded
NOTE: Running task 852 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_populate_sysroot)
NOTE: Running task 853 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_package)
NOTE: recipe libstd-rs-1.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_package: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 854 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-1.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-1.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 855 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_rust_create_wrappers)
NOTE: recipe cargo-1.58.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-1.58.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 856 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_configure)
NOTE: recipe cargo-1.58.1-r0: task do_configure: Started
NOTE: recipe cargo-1.58.1-r0: task do_configure: Succeeded
NOTE: Running task 857 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_compile)
NOTE: recipe cargo-1.58.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_package: Succeeded
NOTE: Running task 858 of 865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.58.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.58.1-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: cargo = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot-native/usr/bin/cargo
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
| NOTE: cargo build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/src/tools/cargo//Cargo.toml
|    Compiling libc v0.2.106
|    Compiling pkg-config v0.3.18
|    Compiling autocfg v1.0.0
|    Compiling proc-macro2 v1.0.30
|    Compiling syn v1.0.80
|    Compiling unicode-xid v0.2.2
|    Compiling cfg-if v1.0.0
|    Compiling serde_derive v1.0.125
|    Compiling serde v1.0.125
|    Compiling cfg-if v0.1.10
|    Compiling log v0.4.14
|    Compiling memchr v2.4.1
|    Compiling matches v0.1.8
|    Compiling crc32fast v1.2.0
|    Compiling bitflags v1.2.1
|    Compiling tinyvec v0.3.4
|    Compiling lazy_static v1.4.0
|    Compiling getrandom v0.2.0
|    Compiling percent-encoding v2.1.0
|    Compiling ryu v1.0.5
|    Compiling getrandom v0.1.14
|    Compiling typenum v1.12.0
|    Compiling anyhow v1.0.34
|    Compiling serde_json v1.0.59
|    Compiling regex-automata v0.1.10
|    Compiling openssl-probe v0.1.2
|    Compiling curl v0.4.41
|    Compiling regex-syntax v0.6.25
|    Compiling openssl v0.10.35
|    Compiling ppv-lite86 v0.2.8
|    Compiling itoa v0.4.6
|    Compiling foreign-types-shared v0.1.1
|    Compiling once_cell v1.7.2
|    Compiling version_check v0.9.3
|    Compiling same-file v1.0.6
|    Compiling byteorder v1.3.4
|    Compiling hex v0.3.2
|    Compiling fnv v1.0.7
|    Compiling semver v1.0.3
|    Compiling utf8parse v0.1.1
|    Compiling unicode-width v0.1.8
|    Compiling remove_dir_all v0.5.3
|    Compiling vec_map v0.8.2
|    Compiling smallvec v1.7.0
|    Compiling either v1.6.0
|    Compiling ansi_term v0.11.0
|    Compiling strsim v0.8.0
|    Compiling humantime v2.0.1
|    Compiling termcolor v1.1.2
|    Compiling shell-escape v0.1.5
|    Compiling hex v0.4.2
|    Compiling glob v0.3.0
|    Compiling home v0.5.3
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/libc-0.2.106/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=5720be28efacdd7e -C extra-filename=-5720be28efacdd7e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/libc-5720be28efacdd7e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name pkg_config /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/pkg-config/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=3cdf13f63c5f263e -C extra-filename=-3cdf13f63c5f263e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name autocfg /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/autocfg-1.0.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=64dba44d0617af5f -C extra-filename=-64dba44d0617af5f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/proc-macro2-1.0.30/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=8316279735a4da6e -C extra-filename=-8316279735a4da6e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/proc-macro2-8316279735a4da6e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/syn-1.0.80/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="extra-traits"' --cfg 'feature="fold"' --cfg 'feature="full"' --cfg 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"' --cfg 'feature="quote"' --cfg 'feature="visit"' --cfg 'feature="visit-mut"' -C metadata=96da1f42ebdbd161 -C extra-filename=-96da1f42ebdbd161 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/syn-96da1f42ebdbd161 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-
 rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=62414d6e8f84a734 -C extra-filename=-62414d6e8f84a734 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/serde_derive-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=1985d9b1e9b816d3 -C extra-filename=-1985d9b1e9b816d3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/serde_derive-1985d9b1e9b816d3 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=1be1a6b06bd8ab2e -C extra-filename=-1be1a6b06bd8ab2e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --
 cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/serde-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"' --cfg 'feature="std"' -C metadata=796a9a755256a205 -C extra-filename=-796a9a755256a205 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/serde-796a9a755256a205 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d978f1a7065402ae -C extra-filename=-d978f1a7065402ae --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/log/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=c486804a376e14c6 -C extra-filename=-c486804a376e14c6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/log-c486804a376e14c6 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/memchr/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=6aa5f882eead95e1 -C extra-filename=-6aa5f882eead95e1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/memchr-6aa5f882eead95e1 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name matches /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/matches-0.1.8/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b50e48db268773cd -C extra-filename=-b50e48db268773cd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints a
 llow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/crc32fast-1.2.0/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=46fa935ae0c264d7 -C extra-filename=-46fa935ae0c264d7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/crc32fast-46fa935ae0c264d7 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/bitflags-1.2.1/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=0fdb6dee4c96701e -C extra-filename=-0fdb6dee4c96701e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/bitflags-0fdb6dee4c96701e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name tinyvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/tinyvec-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' -C metadata=bebfc555a20f45c4 -C extra-filename=-bebfc555a20f45c4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-
 32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name lazy_static /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/lazy_static/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8796ad7ff24a1d1e -C extra-filename=-8796ad7ff24a1d1e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-l
 ints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/getrandom/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=69763f2e298cf8bf -C extra-filename=-69763f2e298cf8bf --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/getrandom-69763f2e298cf8bf -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name percent_encoding /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/percent-encoding/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=065d839d35335d21 -C extra-filename=-065d839d35335d21 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/ryu/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=940c1af0c8f06eaa -C extra-filename=-940c1af0c8f06eaa --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/ryu-940c1af0c8f06eaa -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/getrandom-0.1.14/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=fe3d80f38a9987ae -C extra-filename=-fe3d80f38a9987ae --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/getrandom-fe3d80f38a9987ae -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_main /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/typenum/build/main.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=5bfef11218ef58a8 -C extra-filename=-5bfef11218ef58a8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/typenum-5bfef11218ef58a8 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/anyhow-1.0.34/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=189210bc852a063d -C extra-filename=-189210bc852a063d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/anyhow-189210bc852a063d -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/serde_json-1.0.59/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="raw_value"' --cfg 'feature="std"' --cfg 'feature="unbounded_depth"' -C metadata=6451236de33ca339 -C extra-filename=-6451236de33ca339 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/serde_json-6451236de33ca339 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name regex_automata /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/regex-automata/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b6bca5ec6392a52e -C extra-filename=-b6bca5ec6392a52e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c18f1fff0afb1bec -C extra-filename=-c18f1fff0afb1bec --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=cb635b0fe3304c2c -C extra-filename=-cb635b0fe3304c2c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name openssl_probe /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/openssl-probe/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=17fc14a31a791740 -C extra-filename=-17fc14a31a791740 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --c
 ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/curl/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="http2"' --cfg 'feature="openssl-probe"' --cfg 'feature="openssl-sys"' --cfg 'feature="ssl"' -C metadata=7daef09f5ff07c8e -C extra-filename=-7daef09f5ff07c8e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/curl-7daef09f5ff07c8e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=49337d12d90d790d -C extra-filename=-49337d12d90d790d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/t
 arget/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name regex_syntax --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/regex-syntax/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="unicode"' --cfg 'feature="unicode-age"' --cfg 'feature="unicode-bool"' --cfg 'feature="unicode-case"' --cfg 'feature="unicode-gencat"' --cfg 'feature="unicode-perl"' --cfg 'feature="unicode-script"' --cfg 'feature="unicode-segment"' -C metadata=ba69f29a9b18bc08 -C extra-filename=-ba69f29a9b18bc08 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L 
 dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/openssl/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=d7646e2d8b73a3e0 -C extra-filename=-d7646e2d8b73a3e0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/openssl-d7646e2d8b73a3e0 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name itoa /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/itoa-0.4.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=0b06d10e0dd6cc3d -C extra-filename=-0b06d10e0dd6cc3d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints all
 ow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name ppv_lite86 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/ppv-lite86/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="simd"' --cfg 'feature="std"' -C metadata=89235cabf2a90fd5 -C extra-filename=-89235cabf2a90fd5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name foreign_types_shared /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/foreign-types-shared/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3262760e885830c5 -C extra-filename=-3262760e885830c5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name once_cell --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/once_cell-1.7.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' --cfg 'feature="race"' --cfg 'feature="std"' -C metadata=bb5b2f61e8afc5e4 -C extra-filename=-bb5b2f61e8afc5e4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name version_check /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/version_check/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=bf4b456c8a37de2c -C extra-filename=-bf4b456c8a37de2c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name same_file --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/same-file/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d70d2647d3eb207d -C extra-filename=-d70d2647d3eb207d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/d
 eps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/byteorder/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=5d58b24f808c879f -C extra-filename=-5d58b24f808c879f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/byteorder-5d58b24f808c879f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name hex /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/hex-0.3.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=99cac381155907f2 -C extra-filename=-99cac381155907f2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow
  -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name fnv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/fnv/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=82791a929e29d100 -C extra-filename=-82791a929e29d100 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/semver-1.0.3/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="serde"' --cfg 'feature="std"' -C metadata=6dc6335e76f31ad5 -C extra-filename=-6dc6335e76f31ad5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/semver-6dc6335e76f31ad5 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name utf8parse /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/utf8parse/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=12c7c4b40e5082c6 -C extra-filename=-12c7c4b40e5082c6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints
  allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name unicode_width /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/unicode-width/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=d5865133722fad60 -C extra-filename=-d5865133722fad60 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/bui
 ld/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name remove_dir_all /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/remove_dir_all/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ca2b28edfb6b124b -C extra-filename=-ca2b28edfb6b124b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name smallvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/smallvec/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="may_dangle"' --cfg 'feature="union"' -C metadata=3cd7677ca6256a2e -C extra-filename=-3cd7677ca6256a2e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3
 2-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name vec_map /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/vec_map/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=0c594a32650a6b52 -C extra-filename=-0c594a32650a6b52 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints all
 ow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name either /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/either-1.6.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=44333d349626bd2f -C extra-filename=-44333d349626bd2f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints
  allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name ansi_term /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/ansi_term-0.11.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=78dd240bbc57355a -C extra-filename=-78dd240bbc57355a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --ca
 p-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name strsim /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/strsim/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6c0daee4f507c9d7 -C extra-filename=-6c0daee4f507c9d7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow
  -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name humantime --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/humantime/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=88f80e3c1c5d0939 -C extra-filename=-88f80e3c1c5d0939 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/d
 eps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name termcolor --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/termcolor/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=573fa49193511291 -C extra-filename=-573fa49193511291 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/d
 eps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name shell_escape /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/shell-escape/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=94d4bb63e78edc71 -C extra-filename=-94d4bb63e78edc71 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap
 -lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name hex --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/hex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=257a0ac9fb1c22ba -C extra-filename=-257a0ac9fb1c22ba --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ca
 rgo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|    Compiling lazycell v1.3.0
|    Compiling bytesize v1.0.1
|    Compiling unicode-bidi v0.3.4
|    Compiling thread_local v1.0.1
|      Running `rustc --crate-name glob /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/glob/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8ca3de69be282832 -C extra-filename=-8ca3de69be282832 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L 
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name home --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/home/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=cad739d67ffb735b -C extra-filename=-cad739d67ffb735b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-
 lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name lazycell /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/lazycell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=06c566653e43d446 -C extra-filename=-06c566653e43d446 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints a
 llow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|    Compiling foreign-types v0.3.2
|     Building [                           ] 5/187: pkg-config, same-file, he...
|      Running `rustc --crate-name foreign_types /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/foreign-types/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=7a20d77310ee30f2 -C extra-filename=-7a20d77310ee30f2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --e
 xtern foreign_types_shared=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libforeign_types_shared-3262760e885830c5.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name thread_local /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/thread_local-1.0.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b897b661fc028981 -C extra-filename=-b897b661fc028981 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps
  --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/liblazy_static-8796ad7ff24a1d1e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name unicode_bidi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/unicode-bidi-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=680b39d400d1be11 -C extra-filename=-680b39d400d1be11 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0
 /build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libmatches-b50e48db268773cd.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name bytesize /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/bytesize/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=52afba5c15d3e0f2 -C extra-filename=-52afba5c15d3e0f2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints a
 llow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|    Compiling walkdir v2.3.1
|    Compiling form_urlencoded v1.0.1
|    Compiling vte v0.3.3
|    Compiling textwrap v0.11.0
|     Building [>                         ] 12/187: pkg-config, same-file, he...
|      Running `rustc --crate-name vte /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/vte/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=f61cc9e029e98266 -C extra-filename=-f61cc9e029e98266 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern utf8parse=/hom
 e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libutf8parse-12c7c4b40e5082c6.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name textwrap /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/textwrap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3f8e3de9a69341e9 -C extra-filename=-3f8e3de9a69341e9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern unic
 ode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libunicode_width-d5865133722fad60.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name walkdir --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/walkdir-2.3.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b1f53ff44a2a222d -C extra-filename=-b1f53ff44a2a222d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release
 /deps --extern same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libsame_file-d70d2647d3eb207d.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `rustc --crate-name form_urlencoded --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/form_urlencoded/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5e6599d7f6a16dff -C extra-filename=-5e6599d7f6a16dff --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/targ
 et/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libmatches-b50e48db268773cd.rmeta --extern percent_encoding=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libpercent_encoding-065d839d35335d21.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|     Building [>                         ] 13/187: pkg-config, same-file, he...
|     Building [>                         ] 14/187: pkg-config, same-file, he...
|    Compiling itertools v0.10.1
|     Building [=>                        ] 15/187: pkg-config, same-file, he...
|      Running `rustc --crate-name itertools --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/itertools/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_alloc"' --cfg 'feature="use_std"' -C metadata=4a8bb6e65ad176ca -C extra-filename=-4a8bb6e65ad176ca --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build
 /build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libeither-44333d349626bd2f.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|     Building [=>                        ] 17/187: pkg-config, same-file, he...
|    Compiling strip-ansi-escapes v0.1.0
|     Building [=>                        ] 19/187: pkg-config, same-file, he...
|      Running `rustc --crate-name strip_ansi_escapes /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/strip-ansi-escapes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6833d87bb807153b -C extra-filename=-6833d87bb807153b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/releas
 e/deps --extern vte=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libvte-f61cc9e029e98266.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/log-c486804a376e14c6/build-script-build`
|     Building [=>                        ] 20/187: pkg-config, same-file, he...
|      Running `rustc --crate-name log /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/log/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=406b66214dc50ed8 -C extra-filename=-406b66214dc50ed8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -
 -extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libcfg_if-1be1a6b06bd8ab2e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg atomic_cas --cfg has_atomics`
|     Building [=>                        ] 21/187: pkg-config, same-file, he...
|     Building [==>                       ] 22/187: pkg-config, same-file, he...
|     Building [==>                       ] 23/187: pkg-config, same-file, he...
|     Building [==>                       ] 24/187: pkg-config, same-file, he...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/getrandom-fe3d80f38a9987ae/build-script-build`
|     Building [==>                       ] 25/187: pkg-config, same-file, he...
|     Building [==>                       ] 26/187: pkg-config, same-file, he...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/memchr-6aa5f882eead95e1/build-script-build`
|     Building [==>                       ] 27/187: pkg-config, same-file, he...
|      Running `rustc --crate-name memchr --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/memchr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=0fb840d483ffa5af -C extra-filename=-0fb840d483ffa5af --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg memchr_runtime_simd --cfg memchr_runtime_sse2 --cfg memchr_runtime_sse42 --cfg memchr_runtime_avx`
|     Building [==>                       ] 28/187: pkg-config, same-file, he...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/getrandom-69763f2e298cf8bf/build-script-build`
|     Building [===>                      ] 29/187: pkg-config, hex, shell-es...
|     Building [===>                      ] 30/187: pkg-config, hex, shell-es...
|     Building [===>                      ] 31/187: pkg-config, hex, shell-es...
|     Building [===>                      ] 32/187: pkg-config, hex, shell-es...
|     Building [===>                      ] 33/187: pkg-config, hex, shell-es...
|     Building [===>                      ] 34/187: pkg-config, hex, shell-es...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/anyhow-189210bc852a063d/build-script-build`
|     Building [===>                      ] 35/187: pkg-config, hex, shell-es...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/serde_derive-1985d9b1e9b816d3/build-script-build`
|     Building [====>                     ] 37/187: pkg-config, hex, shell-es...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/crc32fast-46fa935ae0c264d7/build-script-build`
|     Building [====>                     ] 38/187: pkg-config, hex, shell-es...
|     Building [====>                     ] 39/187: pkg-config, hex, shell-es...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/ryu-940c1af0c8f06eaa/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/crc32fast-46fa935ae0c264d7/build-script-build`
|    Compiling unicode-normalization v0.1.13
|     Building [====>                     ] 41/187: pkg-config, hex, shell-es...
|      Running `rustc --crate-name unicode_normalization --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/unicode-normalization-0.1.13/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=a9aec3d0c98c0420 -C extra-filename=-a9aec3d0c98c0420 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/
 build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern tinyvec=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libtinyvec-bebfc555a20f45c4.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0`
|     Building [====>                     ] 42/187: pkg-config, hex, shell-es...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=355ee72f321ca1e2 -C extra-filename=-355ee72f321ca1e2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps/libc
 fg_if-c18f1fff0afb1bec.rmeta --cap-lints allow --cfg crc32fast_stdarchx86`
|     Building [====>                     ] 43/187: pkg-config, hex, serde(bu...
|     Building [=====>                    ] 44/187: pkg-config, hex, serde(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/bitflags-0fdb6dee4c96701e/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/serde-796a9a755256a205/build-script-build`
|     Building [=====>                    ] 45/187: pkg-config, hex, serde(bu...
|     Building [=====>                    ] 46/187: pkg-config, hex, serde(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/serde_json-6451236de33ca339/build-script-build`
|     Building [=====>                    ] 49/187: pkg-config, hex, serde(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/libc-5720be28efacdd7e/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/libc-5720be28efacdd7e/build-script-build`
|      Running `rustc --crate-name ryu --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/ryu/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4d9a0340e393a767 -C extra-filename=-4d9a0340e393a767 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-li
 nts allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg integer128 --cfg maybe_uninit`
|     Building [=====>                    ] 50/187: pkg-config, hex, serde(bu...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=842b2366e71fa676 -C extra-filename=-842b2366e71fa676 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /cargo/1.58.1-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libcfg_if-d978f1a7065402ae.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg crc32fast_stdarchx86`
|     Building [======>                   ] 51/187: pkg-config, hex, serde(bu...
|     Building [======>                   ] 52/187: pkg-config, hex, shell-es...
|      Running `rustc --crate-name bitflags /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/bitflags-1.2.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=a324263ac2fa14a8 -C extra-filename=-a324263ac2fa14a8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/t
 arget/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg bitflags_const_fn`
|     Building [======>                   ] 53/187: pkg-config, hex, shell-es...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/semver-6dc6335e76f31ad5/build-script-build`
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/libc-0.2.106/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=491ad4bfa03b4c44 -C extra-filename=-491ad4bfa03b4c44 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor`
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/libc-0.2.106/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=a8feaa4aec5e39c0 -C extra-filename=-a8feaa4aec5e39c0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg lib
 c_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor`
|      Running `rustc --crate-name anyhow --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/anyhow-1.0.34/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=4c7fc9896c436591 -C extra-filename=-4c7fc9896c436591 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/cargo/1.58.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg backtrace`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/syn-96da1f42ebdbd161/build-script-build`
|     Building [=======>                  ] 59/187: pkg-config, hex, proc-mac...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/syn-96da1f42ebdbd161/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/proc-macro2-8316279735a4da6e/build-script-build`
|     Building [=======>                  ] 60/187: pkg-config, hex, proc-mac...
|     Building [=======>                  ] 61/187: pkg-config, hex, proc-mac...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/proc-macro2-8316279735a4da6e/build-script-build`
|     Building [=======>                  ] 62/187: pkg-config, hex, proc-mac...
|     Building [=======>                  ] 64/187: pkg-config, hex, byteorde...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=64e54d7d9442904b -C extra-filename=-64e54d7d9442904b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/t
 mp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-49337d12d90d790d.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [========>                 ] 65/187: pkg-config, hex, byteorde...
|     Building [========>                 ] 66/187: pkg-config, hex, byteorde...
|     Building [========>                 ] 67/187: pkg-config, hex, byteorde...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=41e54cba5049b2bb -C extra-filename=-41e54cba5049b2bb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r
 0/build/target/release/deps/libunicode_xid-62414d6e8f84a734.rmeta --cap-lints allow --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro`
|    Compiling crossbeam-utils v0.8.3
|     Building [========>                 ] 68/187: pkg-config, hex, byteorde...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/crossbeam-utils-0.8.3/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=352f9ef918705851 -C extra-filename=-352f9ef918705851 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/crossbeam-utils-352f9ef918705851 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern autocfg=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps/libautocfg-64dba44d0617af5f.rlib --cap-lints allow`
|    Compiling im-rc v15.0.0
|     Building [========>                 ] 69/187: pkg-config, hex, byteorde...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/im-rc/./build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=a6c4eac54cae4c37 -C extra-filename=-a6c4eac54cae4c37 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/im-rc-a6c4eac54cae4c37 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps/libversion_check-bf4b456c8
 a37de2c.rlib --cap-lints allow`
|     Building [========>                 ] 70/187: pkg-config, hex, ryu, uni...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/build/byteorder-5d58b24f808c879f/build-script-build`
| error[E0463]: can't find crate for `proc_macro`
|    --> /usr/src/debug/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/proc-macro2-1.0.30/src/lib.rs:102:1
|     |
| 102 | extern crate proc_macro;
|     | ^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
| 
| For more information about this error, try `rustc --explain E0463`.
| error: could not compile `proc-macro2` due to previous error
| 
| Caused by:
|   process didn't exit successfully: `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/vendor/proc-macro2-1.0.30/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=64e54d7d9442904b -C extra-filename=-64e54d7d9442904b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-49337d12d90d790d.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0=/usr/src/debug/cargo/1.58.1-r0 --cfg lexerror_display --cfg hygiene --cfg literal_from_str --cfg is_available --cfg use_proc_macro --cfg wrap_proc_macro` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [========>                 ] 71/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 72/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 73/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 74/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 75/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 76/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 77/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 78/187: pkg-config, hex, ryu, uni...
|     Building [=========>                ] 79/187: pkg-config, hex, ryu, uni...
|     Building [==========>               ] 80/187: hex, ryu, unicode-bidi, i...
|     Building [==========>               ] 81/187: hex, ryu, unicode-bidi, i...
|     Building [==========>               ] 82/187: hex, ryu, unicode-bidi, i...
|     Building [==========>               ] 83/187: hex, unicode-bidi, iterto...
|     Building [==========>               ] 84/187: hex, unicode-bidi, iterto...
|     Building [==========>               ] 85/187: hex, unicode-bidi, iterto...
|     Building [==========>               ] 86/187: hex, unicode-bidi, iterto...
|     Building [===========>              ] 87/187: hex, unicode-bidi, iterto...
|     Building [===========>              ] 88/187: hex, unicode-bidi, iterto...
|     Building [===========>              ] 89/187: unicode-bidi, itertools, ...
|     Building [===========>              ] 90/187: unicode-bidi, itertools, ...
|     Building [===========>              ] 91/187: unicode-bidi, itertools, ...
|     Building [===========>              ] 92/187: unicode-bidi, itertools, ...
|     Building [===========>              ] 93/187: itertools, memchr, regex-...
|     Building [============>             ] 94/187: itertools, memchr, regex-...
|     Building [============>             ] 95/187: itertools, regex-syntax, ...
|     Building [============>             ] 96/187: itertools, regex-syntax, ...
|     Building [============>             ] 97/187: itertools, regex-syntax, ...
|     Building [============>             ] 98/187: itertools, regex-syntax, ...
|     Building [============>             ] 99/187: itertools, regex-syntax
|     Building [============>            ] 100/187: regex-syntax
| error: build failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/run.do_compile.2226414:179 exit 101 from '"cargo" build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/rustc-1.58.1-src/src/tools/cargo//Cargo.toml "$@"'
| WARNING: Backtrace (BB generated script):
| 	#1: oe_cargo_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/run.do_compile.2226414, line 179
| 	#2: cargo_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/run.do_compile.2226414, line 169
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/run.do_compile.2226414, line 163
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/run.do_compile.2226414, line 211
NOTE: recipe cargo-1.58.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 858 tasks of which 737 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cargo-1.58.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/run.do_compile.2226414', 101, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.58.1-r0/temp/log.do_compile.2226414
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.58.1.bb:do_compile) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0110117904012676435==--

