Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826D0C49EC3
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3934.1659679406814789988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WliaNTR0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c99fb53-f6bced29-ce69-4239-9015-d0c8b0124652-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vq157DZWO9FTh3+ampN9wzzb3cyRtDyj6lgphfUmGnk=;
	b=WliaNTR0OB4aTxQa8TBB/8NQsGITflU11wFEld5+mZ4+nwfxNyGXrGnboFBsONBp
	0BvJuNgxNqU8QuiHYOjJx8T5cOHC5SeCovi9vcAKLLbvTk25QWFrldTKxrOIPxQSiz6
	kQfYsWCe46sASi73viAX5zhi/iEMuLdVba8vHT4I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vq157DZWO9FTh3+ampN9wzzb3cyRtDyj6lgphfUmGnk=;
	b=Zwj0qh074m1PsOe52wcdsvyQIae+J8mDk+6ZzBLCshG8/GpEhOB7+IEb27wekjJn
	tLUmTsHqT91xPxCmoCz8MEehVKRkpCMRCrY1icyE/5Gy8KvLUOOnQWwZTuKfoC5HHgf
	Ah/HgYdHgmxaVGsC5SbpqT0RAwvnzIdRyBQRS9Q8=
Content-Type: multipart/mixed; boundary="===============4350636717870156443=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.62.1 FAILED
Message-ID: 
 <010101826c99fb53-f6bced29-ce69-4239-9015-d0c8b0124652-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168885

--===============4350636717870156443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.62.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-263164734510028fd044d0b8961fcb3305644552"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:263164734510028fd044d0b8961fcb3305644552"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 39 Mirrors 0 Missed 28 Current 144 (58% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 163 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 164 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 432 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_fetch)
NOTE: Running task 459 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_fetch)
NOTE: Running task 500 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 501 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_fetch)
NOTE: Running task 504 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 505 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 506 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_fetch)
NOTE: Running task 513 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_fetch)
NOTE: Running task 515 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_fetch)
NOTE: Running task 523 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_fetch: Started
NOTE: recipe rust-native-1.62.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe curl-7.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-1.62.0-r0: task do_fetch: Started
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_fetch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Succeeded
NOTE: Running task 524 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 525 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 180 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 183 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 188 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Succeeded
NOTE: Running task 542 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 191 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 193 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Succeeded
NOTE: Running task 552 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 195 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 558 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Succeeded
NOTE: Running task 559 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe glibc-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 197 of 211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 199 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-native-1_4.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Succeeded
NOTE: Running task 635 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 201 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-native-0.187-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-native-0.187-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 202 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-native-0.9.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-native-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-native-0.9.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 204 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-native-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-native-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-native-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 208 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-native-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-native-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Succeeded
NOTE: Running task 672 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe python3-native-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 210 of 211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 772 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 773 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 774 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 775 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 776 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 777 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 778 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 779 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 780 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_unpack)
NOTE: Running task 782 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 783 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_unpack)
NOTE: Running task 784 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_unpack)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cargo-native-1.62.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-1.62.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.62.0-r0: task do_fetch: Succeeded
NOTE: Running task 785 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_unpack)
NOTE: Running task 786 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_unpack)
NOTE: Running task 787 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_unpack)
NOTE: recipe rust-native-1.62.0-r0: task do_unpack: Started
NOTE: recipe cargo-1.62.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 788 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 789 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 790 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 791 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 792 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 793 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 794 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 795 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 796 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 797 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 798 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_patch)
NOTE: Running task 799 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_rust_setup_snapshot)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_patch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_patch: Succeeded
NOTE: Running task 800 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 801 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_rust_gen_targets)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 802 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_patch)
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_patch: Succeeded
NOTE: Running task 804 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_generate_toolchain_file)
NOTE: Running task 805 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 806 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_configure)
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_configure: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_configure: Succeeded
NOTE: Running task 807 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_compile)
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_compile: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 808 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_patch)
NOTE: Running task 809 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-native-1.62.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_patch: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_patch: Succeeded
NOTE: Running task 810 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cargo-native-1.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-native-1.62.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe libstd-rs-1.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 811 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_patch)
NOTE: recipe libstd-rs-1.62.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_patch: Succeeded
NOTE: Running task 812 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_patch)
NOTE: Running task 814 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-1.62.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-1.62.0-r0: task do_patch: Started
NOTE: recipe cargo-1.62.0-r0: task do_patch: Succeeded
NOTE: Running task 815 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 816 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_populate_lic)
NOTE: recipe cargo-1.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-1.62.0-r0: task do_populate_lic: Started
NOTE: recipe cargo-1.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.62.0-r0: task do_populate_lic: Succeeded
NOTE: recipe cargo-1.62.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe rust-native-1.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 817 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_patch)
NOTE: Running task 818 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.62.0-r0: task do_patch: Started
NOTE: recipe rust-native-1.62.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.62.0-r0: task do_patch: Succeeded
NOTE: Running task 819 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 820 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.62.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.62.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.62.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_compile: Succeeded
NOTE: Running task 821 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_install)
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_install: Succeeded
NOTE: Running task 822 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_populate_sysroot)
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 823 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 824 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-native-1.62.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.62.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 825 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_configure)
NOTE: recipe rust-native-1.62.0-r0: task do_configure: Started
NOTE: recipe rust-native-1.62.0-r0: task do_configure: Succeeded
NOTE: Running task 826 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_compile)
NOTE: recipe rust-native-1.62.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_compile
NOTE: recipe rust-native-1.62.0-r0: task do_compile: Succeeded
NOTE: Running task 827 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_install)
NOTE: recipe rust-native-1.62.0-r0: task do_install: Started
NOTE: recipe rust-native-1.62.0-r0: task do_install: Succeeded
NOTE: Running task 828 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.62.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-native-1.62.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 829 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 830 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 831 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_rust_create_wrappers)
NOTE: Running task 832 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 833 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_configure)
NOTE: recipe cargo-native-1.62.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 834 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_configure)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_configure: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_configure: Succeeded
NOTE: recipe cargo-native-1.62.0-r0: task do_configure: Started
NOTE: Running task 835 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_compile)
NOTE: recipe cargo-native-1.62.0-r0: task do_configure: Succeeded
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_compile: Started
NOTE: Running task 836 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_compile)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_compile: Succeeded
NOTE: Running task 837 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_install)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_compile: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_install: Succeeded
NOTE: Running task 838 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_populate_sysroot)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cargo-native-1.62.0-r0: task do_compile: Succeeded
NOTE: Running task 839 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_install)
NOTE: recipe cargo-native-1.62.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_install: Succeeded
NOTE: Running task 840 of 859 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.62.0-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 841 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 842 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.62.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 843 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_configure)
NOTE: recipe libstd-rs-1.62.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_configure: Succeeded
NOTE: Running task 844 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_compile)
NOTE: recipe libstd-rs-1.62.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_compile: Succeeded
NOTE: Running task 845 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_install)
NOTE: recipe libstd-rs-1.62.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_install: Succeeded
NOTE: Running task 846 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_populate_sysroot)
NOTE: Running task 847 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_package)
NOTE: recipe libstd-rs-1.62.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 848 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-1.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-1.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 849 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-1.62.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-1.62.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 850 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_configure)
NOTE: recipe cargo-1.62.0-r0: task do_configure: Started
NOTE: recipe cargo-1.62.0-r0: task do_configure: Succeeded
NOTE: Running task 851 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_compile)
NOTE: recipe cargo-1.62.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_package: Succeeded
NOTE: Running task 852 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.62.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: cargo = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot-native/usr/bin/cargo
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
| NOTE: cargo build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/src/tools/cargo//Cargo.toml
| warning: profiles for the non root package will be ignored, specify profiles at the workspace root:
| package:   /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/src/tools/rls/racer/Cargo.toml
| workspace: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/Cargo.toml
|    Compiling libc v0.2.125
|    Compiling pkg-config v0.3.18
|    Compiling autocfg v1.1.0
|    Compiling proc-macro2 v1.0.37
|    Compiling syn v1.0.91
|    Compiling unicode-xid v0.2.2
|    Compiling cfg-if v1.0.0
|    Compiling serde_derive v1.0.125
|    Compiling serde v1.0.125
|    Compiling memchr v2.4.1
|    Compiling cfg-if v0.1.10
|    Compiling log v0.4.14
|    Compiling crc32fast v1.2.0
|    Compiling matches v0.1.8
|    Compiling bitflags v1.2.1
|    Compiling getrandom v0.2.0
|    Compiling tinyvec v0.3.4
|    Compiling lazy_static v1.4.0
|    Compiling percent-encoding v2.1.0
|    Compiling ryu v1.0.5
|    Compiling getrandom v0.1.14
|    Compiling regex-automata v0.1.10
|    Compiling once_cell v1.10.0
|    Compiling serde_json v1.0.59
|    Compiling anyhow v1.0.51
|    Compiling typenum v1.12.0
|    Compiling itoa v0.4.6
|    Compiling regex-syntax v0.6.25
|    Compiling crossbeam-utils v0.8.8
|    Compiling curl v0.4.41
|    Compiling ppv-lite86 v0.2.8
|    Compiling openssl v0.10.38
|    Compiling openssl-probe v0.1.2
|    Compiling foreign-types-shared v0.1.1
|    Compiling version_check v0.9.3
|    Compiling byteorder v1.3.4
|    Compiling same-file v1.0.6
|    Compiling hashbrown v0.11.2
|    Compiling remove_dir_all v0.5.3
|    Compiling static_assertions v1.1.0
|    Compiling utf8parse v0.1.1
|    Compiling semver v1.0.3
|    Compiling bytes v1.0.1
|    Compiling fnv v1.0.7
|    Compiling hex v0.3.2
|    Compiling either v1.6.0
|    Compiling termcolor v1.1.2
|    Compiling strsim v0.10.0
|    Compiling humantime v2.0.1
|    Compiling textwrap v0.14.2
|    Compiling hex v0.4.2
|    Compiling shell-escape v0.1.5
|    Compiling smallvec v1.7.0
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/libc/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=2adc98a2095e57df -C extra-filename=-2adc98a2095e57df --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/libc-2adc98a2095e57df -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name pkg_config /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/pkg-config/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=cd22099ed188c82c -C extra-filename=-cd22099ed188c82c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/proc-macro2/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=26fa35549f75c365 -C extra-filename=-26fa35549f75c365 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/proc-macro2-26fa35549f75c365 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name autocfg /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/autocfg/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=55060ae75c912de0 -C extra-filename=-55060ae75c912de0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/syn/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="extra-traits"' --cfg 'feature="fold"' --cfg 'feature="full"' --cfg 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"' --cfg 'feature="quote"' --cfg 'feature="visit"' --cfg 'feature="visit-mut"' -C metadata=f354a192ef37a270 -C extra-filename=-f354a192ef37a270 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/syn-f354a192ef37a270 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.
 0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=14dae918c9fb705e -C extra-filename=-14dae918c9fb705e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target
 /release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=a989ecad34073dba -C extra-filename=-a989ecad34073dba --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/serde_derive-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=bec7d828770764a0 -C extra-filename=-bec7d828770764a0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/serde_derive-bec7d828770764a0 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/serde-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"' --cfg 'feature="std"' -C metadata=28bb50de5d6656d2 -C extra-filename=-28bb50de5d6656d2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/serde-28bb50de5d6656d2 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/memchr/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=dd10855958b186cf -C extra-filename=-dd10855958b186cf --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/memchr-dd10855958b186cf -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=24f4bb3460859afd -C extra-filename=-24f4bb3460859afd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/log-0.4.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=977faae6a8c68ebf -C extra-filename=-977faae6a8c68ebf --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/log-977faae6a8c68ebf -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/crc32fast-1.2.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=4ae6f9dbaa76a26f -C extra-filename=-4ae6f9dbaa76a26f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/crc32fast-4ae6f9dbaa76a26f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name matches /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/matches-0.1.8/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=eba7ea1bc1c8a369 -C extra-filename=-eba7ea1bc1c8a369 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/bitflags-1.2.1/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=7a4b7901b31d5a97 -C extra-filename=-7a4b7901b31d5a97 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/bitflags-7a4b7901b31d5a97 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/getrandom/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=2ff5de8456c52e49 -C extra-filename=-2ff5de8456c52e49 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/getrandom-2ff5de8456c52e49 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name tinyvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/tinyvec-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' -C metadata=354f28f04e742e9d -C extra-filename=-354f28f04e742e9d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name lazy_static /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/lazy_static/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a1c1a4780fe29eda -C extra-filename=-a1c1a4780fe29eda --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/rele
 ase/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name percent_encoding /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/percent-encoding/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3d0075e688932bba -C extra-filename=-3d0075e688932bba --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/ryu-1.0.5/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=45d92a38b7538ef3 -C extra-filename=-45d92a38b7538ef3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/ryu-45d92a38b7538ef3 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
| warning: target json file contains unused fields: has-elf-tls
| 
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/getrandom-0.1.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=afc36c2ad452cd5a -C extra-filename=-afc36c2ad452cd5a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/getrandom-afc36c2ad452cd5a -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name regex_automata /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/regex-automata/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=cb5e6da613ee07ff -C extra-filename=-cb5e6da613ee07ff --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name once_cell --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/once_cell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' --cfg 'feature="race"' --cfg 'feature="std"' -C metadata=74d52c33b4569257 -C extra-filename=-74d52c33b4569257 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/p
 okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/serde_json-1.0.59/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="raw_value"' --cfg 'feature="std"' --cfg 'feature="unbounded_depth"' -C metadata=e80b9de30b61c069 -C extra-filename=-e80b9de30b61c069 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/serde_json-e80b9de30b61c069 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/anyhow-1.0.51/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=878ca48af06783d1 -C extra-filename=-878ca48af06783d1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/anyhow-878ca48af06783d1 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_main /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/typenum/build/main.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=4d7891e1eefd4e44 -C extra-filename=-4d7891e1eefd4e44 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/typenum-4d7891e1eefd4e44 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name itoa /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/itoa-0.4.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6840b92809392d38 -C extra-filename=-6840b92809392d38 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps
  --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name regex_syntax --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/regex-syntax/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="unicode"' --cfg 'feature="unicode-age"' --cfg 'feature="unicode-bool"' --cfg 'feature="unicode-case"' --cfg 'feature="unicode-gencat"' --cfg 'feature="unicode-perl"' --cfg 'feature="unicode-script"' --cfg 'feature="unicode-segment"' -C metadata=bc4891f077ca0eba -C extra-filename=-bc4891f077ca0eba --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/targ
 et-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/crossbeam-utils/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=49380ca294161bfe -C extra-filename=-49380ca294161bfe --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/crossbeam-utils-49380ca294161bfe -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=bc64960d0248b9fe -C extra-filename=-bc64960d0248b9fe --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/curl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="http2"' --cfg 'feature="openssl-probe"' --cfg 'feature="openssl-sys"' --cfg 'feature="ssl"' -C metadata=9657041b4f378d70 -C extra-filename=-9657041b4f378d70 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/curl-9657041b4f378d70 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints all
 ow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c026f451b29534c9 -C extra-filename=-c026f451b29534c9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name ppv_lite86 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/ppv-lite86/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="simd"' --cfg 'feature="std"' -C metadata=f8d3fa4008f11b92 -C extra-filename=-f8d3fa4008f11b92 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/openssl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c098639729b461c3 -C extra-filename=-c098639729b461c3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/openssl-c098639729b461c3 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
| warning: `cfg-if` (lib) generated 2 warnings (1 duplicate)
|      Running `rustc --crate-name openssl_probe /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/openssl-probe/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=f1593704af318926 -C extra-filename=-f1593704af318926 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/
 release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name foreign_types_shared /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/foreign-types-shared/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3bdd03c4c987eeff -C extra-filename=-3bdd03c4c987eeff --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=9f85e0adf63fa2ea -C extra-filename=-9f85e0adf63fa2ea --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name version_check /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/version_check-0.9.3/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=b8053bdf1aeffb2a -C extra-filename=-b8053bdf1aeffb2a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/byteorder/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=7423a4d4807dd6c1 -C extra-filename=-7423a4d4807dd6c1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/byteorder-7423a4d4807dd6c1 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
| warning: `matches` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name same_file --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/same-file/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=2fc7716770c751dc -C extra-filename=-2fc7716770c751dc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name hashbrown --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/hashbrown-0.11.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="raw"' -C metadata=0239888ecb20cadc -C extra-filename=-0239888ecb20cadc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky
 -linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name remove_dir_all /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/remove_dir_all/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d8c68cdfec857e95 -C extra-filename=-d8c68cdfec857e95 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name static_assertions /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/static_assertions/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=0e1718856dcb5a36 -C extra-filename=-0e1718856dcb5a36 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name utf8parse /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/utf8parse/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=365d607dd5e0036e -C extra-filename=-365d607dd5e0036e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/semver-1.0.3/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="serde"' --cfg 'feature="std"' -C metadata=ddfa079c9a63c99a -C extra-filename=-ddfa079c9a63c99a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/semver-ddfa079c9a63c99a -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=0d713ecf5b005a0f -C extra-filename=-0d713ecf5b005a0f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name fnv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/fnv/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=a4e7d97a97ad24bd -C extra-filename=-a4e7d97a97ad24bd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo
 /1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `lazy_static` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name hex /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/hex-0.3.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d506a2142d136ff8 -C extra-filename=-d506a2142d136ff8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name either /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/either-1.6.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=9bb992a4631c096b -C extra-filename=-9bb992a4631c096b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/
 deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name termcolor --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/termcolor/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5ea4191045d86531 -C extra-filename=-5ea4191045d86531 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name strsim /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/strsim/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3d0a778ad8ac9556 -C extra-filename=-3d0a778ad8ac9556 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -
 -cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name humantime --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/humantime/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=723416f8476cb7a2 -C extra-filename=-723416f8476cb7a2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/
 target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name textwrap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/textwrap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a0ddafbcef55db54 -C extra-filename=-a0ddafbcef55db54 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/ta
 rget/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name hex --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/hex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=3bb3103edd521096 -C extra-filename=-3bb3103edd521096 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-
 32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|    Compiling glob v0.3.0
|    Compiling bytesize v1.0.1
|    Compiling lazycell v1.3.0
|    Compiling home v0.5.3
|      Running `rustc --crate-name smallvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/smallvec-1.7.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="may_dangle"' --cfg 'feature="union"' -C metadata=bae40fc2e5c759ad -C extra-filename=-bae40fc2e5c759ad --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/
 build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name shell_escape /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/shell-escape/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=dab3db9bb76147ae -C extra-filename=-dab3db9bb76147ae --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name glob /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/glob/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=253cffcce37418f2 -C extra-filename=-253cffcce37418f2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap
 -lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name bytesize /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/bytesize/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=1a161080657ac715 -C extra-filename=-1a161080657ac715 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|    Compiling pathdiff v0.2.1
|    Compiling unicode-width v0.1.8
|    Compiling unicode-bidi v0.3.4
|      Running `rustc --crate-name lazycell /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/lazycell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=679a99c7354d080f -C extra-filename=-679a99c7354d080f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/de
 ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name home --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/home/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=fe9c658a7300c896 -C extra-filename=-fe9c658a7300c896 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/rel
 ease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name pathdiff --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/pathdiff/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8d6b3ee44a263d97 -C extra-filename=-8d6b3ee44a263d97 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/ta
 rget/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|      Running `rustc --crate-name unicode_width /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/unicode-width/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=077a66e6c3a0f582 -C extra-filename=-077a66e6c3a0f582 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/car
 go/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `foreign-types-shared` (lib) generated 2 warnings (2 duplicates)
|    Compiling foreign-types v0.3.2
|      Running `rustc --crate-name unicode_bidi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/unicode-bidi-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=204f93d01db88511 -C extra-filename=-204f93d01db88511 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /cargo/1.62.0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libmatches-eba7ea1bc1c8a369.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|     Building [>                          ] 8/195: ryu(build.rs), crc32fast(...
| warning: `remove_dir_all` (lib) generated 2 warnings (2 duplicates)
|    Compiling kstring v2.0.0
|     Building [>                          ] 9/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name kstring --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/kstring/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="max_inline"' --cfg 'feature="std"' --cfg 'feature="unsafe"' -C metadata=e63a395c0451778c -C extra-filename=-e63a395c0451778c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/hom
 e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern static_assertions=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libstatic_assertions-0e1718856dcb5a36.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `fnv` (lib) generated 2 warnings (2 duplicates)
|     Building [>                         ] 10/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name foreign_types /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/foreign-types/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b563256a9ff4e756 -C extra-filename=-b563256a9ff4e756 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/
 release/deps --extern foreign_types_shared=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libforeign_types_shared-3bdd03c4c987eeff.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `static_assertions` (lib) generated 2 warnings (2 duplicates)
|     Building [>                         ] 11/195: ryu(build.rs), crc32fast(...
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|    Compiling vte v0.3.3
|     Building [>                         ] 12/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name vte /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/vte/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=fbc463cc301d5ca0 -C extra-filename=-fbc463cc301d5ca0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --exter
 n utf8parse=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libutf8parse-365d607dd5e0036e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `pathdiff` (lib) generated 2 warnings (2 duplicates)
|    Compiling walkdir v2.3.2
|     Building [>                         ] 13/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name walkdir --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/walkdir/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=bb88aac07064642d -C extra-filename=-bb88aac07064642d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/targ
 et/release/deps --extern same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libsame_file-2fc7716770c751dc.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `itoa` (lib) generated 2 warnings (2 duplicates)
|    Compiling form_urlencoded v1.0.1
|     Building [>                         ] 14/195: ryu(build.rs), crc32fast(...
| warning: `utf8parse` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 15/195: ryu(build.rs), crc32fast(...
| warning: `foreign-types` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 16/195: ryu(build.rs), crc32fast(...
| warning: `unicode-width` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 17/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name form_urlencoded --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/form_urlencoded/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c934f7e1c7ead602 -C extra-filename=-c934f7e1c7ead602 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62
 .0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libmatches-eba7ea1bc1c8a369.rmeta --extern percent_encoding=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libpercent_encoding-3d0075e688932bba.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `lazycell` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 18/195: ryu(build.rs), crc32fast(...
|    Compiling itertools v0.10.1
|      Running `rustc --crate-name itertools --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/itertools-0.10.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_alloc"' --cfg 'feature="use_std"' -C metadata=1454ff6e8e756d60 -C extra-filename=-1454ff6e8e756d60 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild
 /yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libeither-9bb992a4631c096b.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `either` (lib) generated 2 warnings (2 duplicates)
|    Compiling thread_local v1.1.4
|     Building [=>                        ] 19/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name thread_local --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/thread_local/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=db808c8d33a0a281 -C extra-filename=-db808c8d33a0a281 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/
 build/target/release/deps --extern once_cell=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libonce_cell-74d52c33b4569257.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `same-file` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 20/195: ryu(build.rs), crc32fast(...
| warning: `bytesize` (lib) generated 2 warnings (2 duplicates)
|    Compiling strip-ansi-escapes v0.1.0
|     Building [=>                        ] 21/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name strip_ansi_escapes /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/strip-ansi-escapes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8d6d2b67c9a2d704 -C extra-filename=-8d6d2b67c9a2d704 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/bui
 ld/target/release/deps --extern vte=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libvte-fbc463cc301d5ca0.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `vte` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 22/195: ryu(build.rs), crc32fast(...
| warning: `curl` (build script) generated 2 warnings (2 duplicates)
| warning: `log` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 24/195: ryu(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/log-977faae6a8c68ebf/build-script-build`
|     Building [==>                       ] 25/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name log /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/log-0.4.14/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=ea1f2c536b79c3e2 -C extra-filename=-ea1f2c536b79c3e2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/buil
 d/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-14dae918c9fb705e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg atomic_cas --cfg has_atomics`
| warning: `strip-ansi-escapes` (lib) generated 2 warnings (2 duplicates)
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 27/195: ryu(build.rs), crc32fast(...
| warning: `crossbeam-utils` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 28/195: ryu(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/crossbeam-utils-49380ca294161bfe/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/getrandom-2ff5de8456c52e49/build-script-build`
| warning: `memchr` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 29/195: ryu(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/memchr-dd10855958b186cf/build-script-build`
| warning: `once_cell` (lib) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 30/195: ryu(build.rs), crc32fast(...
|     Building [===>                      ] 31/195: ryu(build.rs), crc32fast(...
|     Building [===>                      ] 32/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name crossbeam_utils --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/crossbeam-utils/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=79807ae8024f197d -C extra-filename=-79807ae8024f197d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps 
 -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-14dae918c9fb705e.rmeta --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/liblazy_static-a1c1a4780fe29eda.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|     Building [===>                      ] 33/195: ryu(build.rs), crc32fast(...
|      Running `rustc --crate-name memchr --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/memchr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=e29caa91b236aef2 -C extra-filename=-e29caa91b236aef2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg memchr_runtime_simd --cfg memchr_runtime_sse2 --cfg memchr_runtime_sse42 --cfg memchr_runtime_avx`
| warning: `openssl` (build script) generated 2 warnings (2 duplicates)
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 35/195: ryu(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/getrandom-afc36c2ad452cd5a/build-script-build`
|     Building [===>                      ] 36/195: ryu(build.rs), crc32fast(...
| warning: `smallvec` (lib) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 37/195: ryu(build.rs), crc32fast(...
| warning: `home` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 38/195: ryu(build.rs), crc32fast(...
| warning: `kstring` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 39/195: ryu(build.rs), crc32fast(...
| warning: `bitflags` (build script) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 40/195: ryu(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/bitflags-7a4b7901b31d5a97/build-script-build`
| warning: `crc32fast` (build script) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 41/195: ryu(build.rs), hashbrown,...
| warning: `serde_derive` (build script) generated 2 warnings (2 duplicates)
| warning: `shell-escape` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 43/195: ryu(build.rs), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/serde_derive-bec7d828770764a0/build-script-build`
| warning: `openssl-probe` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 44/195: ryu(build.rs), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/crc32fast-4ae6f9dbaa76a26f/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/crc32fast-4ae6f9dbaa76a26f/build-script-build`
|    Compiling unicode-normalization v0.1.13
|     Building [=====>                    ] 45/195: ryu(build.rs), hashbrown,...
|      Running `rustc --crate-name unicode_normalization --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/unicode-normalization-0.1.13/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=dc370933601ec925 -C extra-filename=-dc370933601ec925 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-w
 orker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern tinyvec=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libtinyvec-354f28f04e742e9d.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `serde_json` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 46/195: ryu(build.rs), hashbrown,...
|      Running `rustc --crate-name bitflags /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/bitflags-1.2.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=0cc7f99387ec4504 -C extra-filename=-0cc7f99387ec4504 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg bitflags_const_fn`
|     Building [=====>                    ] 47/195: ryu(build.rs), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/serde_json-e80b9de30b61c069/build-script-build`
| warning: `anyhow` (build script) generated 2 warnings (2 duplicates)
| warning: `tinyvec` (lib) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 49/195: ryu(build.rs), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/anyhow-878ca48af06783d1/build-script-build`
| warning: `libc` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 50/195: ryu(build.rs), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/libc-2adc98a2095e57df/build-script-build`
|     Building [=====>                    ] 51/195: ryu(build.rs), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/libc-2adc98a2095e57df/build-script-build`
| warning: `autocfg` (lib) generated 2 warnings (2 duplicates)
|    Compiling indexmap v1.8.0
|     Building [=====>                    ] 52/195: ryu(build.rs), hashbrown,...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=da3c7ab88940728e -C extra-filename=-da3c7ab88940728e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/r
 elease/deps/libcfg_if-9f85e0adf63fa2ea.rmeta --cap-lints allow --cfg crc32fast_stdarchx86`
| warning: `serde` (build script) generated 2 warnings (2 duplicates)
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/serde-28bb50de5d6656d2/build-script-build`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/indexmap-1.8.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=d2997fc4bb392a7f -C extra-filename=-d2997fc4bb392a7f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/indexmap-d2997fc4bb392a7f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern autocfg=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/
 build/target/release/deps/libautocfg-55060ae75c912de0.rlib --cap-lints allow`
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=eecb13b5cc627a18 -C extra-filename=-eecb13b5cc627a18 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libcfg_if-24f4bb3460859afd.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg crc32fast_stdarchx86`
|     Building [======>                   ] 54/195: ryu(build.rs), hashbrown,...
|     Building [======>                   ] 55/195: ryu(build.rs), hashbrown,...
| warning: `ryu` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 56/195: hashbrown, textwrap, byte...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/ryu-45d92a38b7538ef3/build-script-build`
| warning: `syn` (build script) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/libc/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=48a7141620d0496e -C extra-filename=-48a7141620d0496e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align -
 -cfg libc_int128 --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of --cfg libc_underscore_const_names`
|     Building [======>                   ] 59/195: hashbrown, textwrap, libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/syn-f354a192ef37a270/build-script-build`
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/libc/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=f5bf058416be368a -C extra-filename=-f5bf058416be368a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg libc_int128 --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of --cfg libc_underscore_const_names`
|     Building [=======>                  ] 60/195: hashbrown, textwrap, libc...
| warning: `regex-automata` (lib) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 61/195: hashbrown, textwrap, libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/syn-f354a192ef37a270/build-script-build`
| warning: `bitflags` (lib) generated 2 warnings (2 duplicates)
| warning: `percent-encoding` (lib) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 64/195: hashbrown, textwrap, libc...
|      Running `rustc --crate-name ryu --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/ryu-1.0.5/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d804228d29f15b52 -C extra-filename=-d804228d29f15b52 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target
 /release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg integer128 --cfg maybe_uninit`
| warning: `proc-macro2` (build script) generated 2 warnings (2 duplicates)
| warning: `version_check` (lib) generated 2 warnings (2 duplicates)
|     Building [=======>                  ] 66/195: hashbrown, textwrap, libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/proc-macro2-26fa35549f75c365/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/proc-macro2-26fa35549f75c365/build-script-build`
|    Compiling im-rc v15.0.0
|     Building [=======>                  ] 67/195: hashbrown, textwrap, libc...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/im-rc/./build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=5ecff3eeb2cf2bf9 -C extra-filename=-5ecff3eeb2cf2bf9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/im-rc-5ecff3eeb2cf2bf9 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps/
 libversion_check-b8053bdf1aeffb2a.rlib --cap-lints allow`
|     Building [========>                 ] 68/195: hashbrown, textwrap, libc...
| warning: `semver` (build script) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 69/195: semver(build), hashbrown,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/semver-ddfa079c9a63c99a/build-script-build`
|     Building [========>                 ] 70/195: semver(build), hashbrown,...
|     Building [========>                 ] 71/195: semver(build), hashbrown,...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/proc-macro2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=b5c96195ed77282f -C extra-filename=-b5c96195ed77282f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo
 /1.62.0-r0/build/target/release/deps/libunicode_xid-a989ecad34073dba.rmeta --cap-lints allow --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [========>                 ] 72/195: semver(build), hashbrown,...
|      Running `rustc --crate-name anyhow --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/anyhow-1.0.51/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=ac7743f0b642e4bb -C extra-filename=-ac7743f0b642e4bb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg backtrace`
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/proc-macro2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=fe88fd8172d96669 -C extra-filename=-fe88fd8172d96669 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-bc64960d0248b9fe.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [========>                 ] 73/195: hashbrown, textwrap, libc...
| warning: `byteorder` (build script) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 74/195: hashbrown, textwrap, libc...
| warning: `ppv-lite86` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 75/195: hashbrown, textwrap, libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/byteorder-7423a4d4807dd6c1/build-script-build`
|     Building [=========>                ] 76/195: hashbrown, textwrap, libc...
|      Running `rustc --crate-name byteorder /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/byteorder/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=da878f2ad43042e1 -C extra-filename=-da878f2ad43042e1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/cargo/1.62.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg byteorder_i128`
| error[E0463]: can't find crate for `proc_macro`
|    --> /usr/src/debug/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/proc-macro2/src/lib.rs:119:1
|     |
| 119 | extern crate proc_macro;
|     | ^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
| 
| warning: `form_urlencoded` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 77/195: hashbrown, textwrap, libc...
| warning: `thread_local` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 78/195: hashbrown, textwrap, libc...
| warning: `humantime` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 79/195: hashbrown, textwrap, libc...
| warning: `indexmap` (build script) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 80/195: hashbrown, textwrap, libc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/indexmap-d2997fc4bb392a7f/build-script-build`
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 81/195: hashbrown, textwrap, libc...
| warning: `pkg-config` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 82/195: hashbrown, textwrap, libc...
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 83/195: hashbrown, textwrap, libc...
|     Building [==========>               ] 84/195: hashbrown, textwrap, libc...
|    Compiling aho-corasick v0.7.18
|      Running `rustc --crate-name aho_corasick --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/aho-corasick/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=c040a810dc39bf6b -C extra-filename=-c040a810dc39bf6b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e29caa91b236aef2.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|    Compiling bstr v0.2.13
|    Compiling combine v4.6.3
|      Running `rustc --crate-name bstr /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/bstr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="regex-automata"' --cfg 'feature="std"' --cfg 'feature="unicode"' -C metadata=e578c1b655d51a0d -C extra-filename=-e578c1b655d51a0d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L d
 ependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/liblazy_static-a1c1a4780fe29eda.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e29caa91b236aef2.rmeta --extern regex_automata=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libregex_automata-cb5e6da613ee07ff.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/ca
 rgo/1.62.0-r0`
|      Running `rustc --crate-name combine --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/combine/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="bytes"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=ef2a18d9bccab342 -C extra-filename=-ef2a18d9bccab342 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/poky
 build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern bytes=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libbytes-0d713ecf5b005a0f.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e29caa91b236aef2.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
|    Compiling os_str_bytes v6.0.0
|      Running `rustc --crate-name os_str_bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/os_str_bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="memchr"' --cfg 'feature="raw_os_str"' -C metadata=cfb54c2ec23b3d64 -C extra-filename=-cfb54c2ec23b3d64 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libmemchr-e29caa91b236aef2.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0`
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 85/195: hashbrown, textwrap, libc...
| warning: `textwrap` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 86/195: hashbrown, libc, libc, by...
| warning: `typenum` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 87/195: hashbrown, libc, libc, by...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/typenum-4d7891e1eefd4e44/build-script-main`
| warning: `log` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 88/195: hashbrown, libc, libc, by...
|      Running `rustc --crate-name indexmap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/indexmap-1.8.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=7b65ee51fce26fd8 -C extra-filename=-7b65ee51fce26fd8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/cargo/1.62.0-r0/build/target/release/deps --extern hashbrown=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libhashbrown-0239888ecb20cadc.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg has_std --cfg rustc_1_51`
| warning: `im-rc` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 89/195: hashbrown, libc, libc, by...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/build/im-rc-5ecff3eeb2cf2bf9/build-script-build`
| warning: `ryu` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 90/195: hashbrown, libc, libc, by...
| warning: `hashbrown` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 91/195: libc, libc, bytes, hex, s...
|     Building [===========>              ] 92/195: libc, libc, bytes, hex, s...
| For more information about this error, try `rustc --explain E0463`.
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
| error: could not compile `proc-macro2` due to previous error; 2 warnings emitted
| 
| Caused by:
|   process didn't exit successfully: `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/vendor/proc-macro2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=fe88fd8172d96669 -C extra-filename=-fe88fd8172d96669 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps -L dependency=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/build/target/i686-poky-linux/release/deps/libunicode_xid-bc64960d0248b9fe.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0=/usr/src/debug/cargo/1.62.0-r0 --cfg use_proc_macro --cfg wrap_proc_macro` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [===========>              ] 93/195: libc, libc, bytes, hex, s...
|     Building [===========>              ] 94/195: libc, libc, bytes, hex, s...
| warning: `termcolor` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 95/195: libc, libc, bytes, hex, s...
| warning: `byteorder` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 96/195: libc, libc, bytes, hex, s...
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 97/195: libc, libc, bytes, strsim...
| warning: `strsim` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 98/195: libc, libc, bytes, unicod...
| warning: `os_str_bytes` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 99/195: libc, libc, bytes, unicod...
| warning: `unicode-bidi` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>             ] 100/195: libc, libc, bytes, unicod...
| warning: `walkdir` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>             ] 101/195: libc, libc, bytes, unicod...
| warning: `bytes` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 102/195: libc, libc, unicode-norma...
| warning: `crossbeam-utils` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 103/195: libc, libc, unicode-norma...
| warning: `anyhow` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 104/195: libc, libc, unicode-norma...
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 105/195: libc, libc, unicode-norma...
| warning: `glob` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 106/195: libc, libc, unicode-norma...
| warning: `memchr` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 107/195: libc, libc, unicode-norma...
| warning: `indexmap` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 108/195: libc, libc, unicode-norma...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 109/195: libc, unicode-normalizati...
| warning: `unicode-normalization` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 110/195: libc, combine, aho-corasi...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 111/195: combine, aho-corasick, it...
| warning: `bstr` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 112/195: combine, aho-corasick, it...
| warning: `aho-corasick` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 113/195: combine, itertools, regex...
| warning: `itertools` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 114/195: combine, regex-syntax
| warning: `regex-syntax` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 115/195: combine
| warning: `combine` (lib) generated 2 warnings (2 duplicates)
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/run.do_compile.4136801:176 exit 101 from '"cargo" build -v --target i686-poky-linux --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/rustc-1.62.0-src/src/tools/cargo//Cargo.toml "$@"'
| WARNING: Backtrace (BB generated script):
| 	#1: oe_cargo_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/run.do_compile.4136801, line 176
| 	#2: cargo_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/run.do_compile.4136801, line 166
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/run.do_compile.4136801, line 160
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/run.do_compile.4136801, line 208
NOTE: recipe cargo-1.62.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 852 tasks of which 752 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cargo-1.62.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/run.do_compile.4136801', 101, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.0-r0/temp/log.do_compile.4136801
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_compile) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4350636717870156443==--

