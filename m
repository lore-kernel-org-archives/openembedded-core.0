Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F90C48BE4
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.6335.1660589820582764022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LCw8GNXg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182a2ddc629-7220f87f-5b3a-4a11-9e76-526ff9b64ecc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VYSI6kaF4BO/IC+yR6pEkQsxzGlBEciE8/8o4Rgxdl0=;
	b=LCw8GNXgKGqUtAcrEv7zwRdihnHE36yo97D04tz7GIKLCYWpTuLvcgYgUMJTM9IK
	Nms1gglbSVpjDmWBKkaPtdTPXi0WLEdjNrM+2fDG61tp0E6TzVqejw3fvYjyGtjYLp/
	KvNoyAGqRCZ77XstS/avc7Rpf2bVRJJFEbyRAO6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VYSI6kaF4BO/IC+yR6pEkQsxzGlBEciE8/8o4Rgxdl0=;
	b=IqoP0N19oKkXLC4MbGRvKyaLrezVA1Cv4m3gJ/j+O7kIk1i/a2cb1zP9DvB3gIE6
	pe+9e+2jMva8oPzHVr/JaBpb+8OMPU/5M4tqZf6Rkj7/KmIrm2B1H4R2b3i664oBvYW
	q2GFAyzIsQdieVwY2Mkz92IGt4CkCRyCzgllqZes=
Content-Type: multipart/mixed; boundary="===============3333025884009532084=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.63.0 FAILED
Message-ID: 
 <01010182a2ddc629-7220f87f-5b3a-4a11-9e76-526ff9b64ecc-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169372

--===============3333025884009532084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.63.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fde00247e01001d6b6bb879da5dd054c6e78d881"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fde00247e01001d6b6bb879da5dd054c6e78d881"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 74 Local 48 Mirrors 0 Missed 26 Current 135 (64% match, 87% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 149 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 535 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_fetch)
NOTE: Running task 536 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_fetch)
NOTE: Running task 571 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 572 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_fetch)
NOTE: Running task 575 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 576 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 601 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_fetch)
NOTE: Running task 603 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_fetch)
NOTE: Running task 611 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_fetch: Started
NOTE: recipe curl-7.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-1.62.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_fetch: Started
NOTE: recipe rust-native-1.62.1-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_fetch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Succeeded
NOTE: Running task 614 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 615 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 166 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 167 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 168 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 169 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 170 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 171 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 176 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 178 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 181 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Succeeded
NOTE: Running task 632 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 187 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 189 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 192 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Succeeded
NOTE: Running task 645 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 194 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 196 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 648 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Succeeded
NOTE: Running task 649 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 198 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 199 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Succeeded
NOTE: Running setscene task 208 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: Running task 664 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.62.1-r0: task do_fetch: Succeeded
NOTE: Running task 769 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_unpack)
NOTE: Running task 770 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 771 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_unpack)
NOTE: recipe libstd-rs-1.62.1-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 773 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 774 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 775 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 776 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 777 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 778 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 779 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 780 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 781 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 782 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.62.1-r0: task do_fetch: Succeeded
NOTE: recipe cargo-1.62.1-r0: task do_fetch: Succeeded
NOTE: Running task 783 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_unpack)
NOTE: Running task 784 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_unpack)
NOTE: Running task 785 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_unpack)
NOTE: recipe cargo-1.62.1-r0: task do_unpack: Started
NOTE: recipe rust-native-1.62.1-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 786 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_patch)
NOTE: recipe libstd-rs-1.62.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 787 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 788 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 789 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 790 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 791 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 792 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 793 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 794 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 795 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 796 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 797 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 798 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 799 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 800 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_patch)
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 801 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_generate_toolchain_file)
NOTE: Running task 802 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 803 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_configure)
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_configure: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 804 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_compile)
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_compile: Started
NOTE: recipe cargo-1.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 805 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_patch)
NOTE: Running task 806 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-1.62.1-r0: task do_patch: Started
NOTE: recipe cargo-1.62.1-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 807 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 808 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_rust_gen_targets)
NOTE: Running task 809 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_populate_lic)
NOTE: recipe cargo-1.62.1-r0: task do_rust_gen_targets: Started
NOTE: recipe cargo-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-1.62.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe cargo-1.62.1-r0: task do_populate_lic: Started
NOTE: recipe cargo-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.62.1-r0: task do_populate_lic: Succeeded
NOTE: recipe cargo-1.62.1-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe rust-native-1.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 810 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_patch)
NOTE: Running task 811 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.62.1-r0: task do_patch: Started
NOTE: recipe rust-native-1.62.1-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 812 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 813 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.62.1-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.62.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.62.1-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe cargo-native-1.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_patch)
NOTE: Running task 815 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-native-1.62.1-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_patch: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 816 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 817 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_rust_gen_targets)
NOTE: recipe cargo-native-1.62.1-r0: task do_rust_gen_targets: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe cargo-native-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-native-1.62.1-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_compile: Succeeded
NOTE: Running task 818 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_install)
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_install: Succeeded
NOTE: Running task 819 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb:do_populate_sysroot)
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe rust-llvm-native-1.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 820 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 821 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_rust_create_wrappers)
NOTE: recipe rust-native-1.62.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.62.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 822 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_configure)
NOTE: recipe rust-native-1.62.1-r0: task do_configure: Started
NOTE: recipe rust-native-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 823 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_compile)
NOTE: recipe rust-native-1.62.1-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_compile
NOTE: recipe rust-native-1.62.1-r0: task do_compile: Succeeded
NOTE: Running task 824 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_install)
NOTE: recipe rust-native-1.62.1-r0: task do_install: Started
NOTE: recipe rust-native-1.62.1-r0: task do_install: Succeeded
NOTE: Running task 825 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.1.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe rust-native-1.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 826 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-native-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 827 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.62.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 828 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_configure)
NOTE: recipe cargo-native-1.62.1-r0: task do_configure: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 829 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_compile)
NOTE: recipe cargo-native-1.62.1-r0: task do_compile: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_compile: Succeeded
NOTE: Running task 830 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_install)
NOTE: recipe cargo-native-1.62.1-r0: task do_install: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_install: Succeeded
NOTE: Running task 831 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 832 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 833 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.62.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 834 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_configure)
NOTE: recipe libstd-rs-1.62.1-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 835 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_compile)
NOTE: recipe libstd-rs-1.62.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_compile: Succeeded
NOTE: Running task 836 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_install)
NOTE: recipe libstd-rs-1.62.1-r0: task do_install: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_install: Succeeded
NOTE: Running task 837 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_populate_sysroot)
NOTE: Running task 838 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_package)
NOTE: recipe libstd-rs-1.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_package: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 839 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 840 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_rust_create_wrappers)
NOTE: recipe cargo-1.62.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-1.62.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 841 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_configure)
NOTE: recipe cargo-1.62.1-r0: task do_configure: Started
NOTE: recipe cargo-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 842 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_compile)
NOTE: recipe cargo-1.62.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_package: Succeeded
NOTE: Running task 843 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.62.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: Using rust targets from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rust-targets/
| NOTE: cargo = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot-native/usr/bin/cargo
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
| NOTE: cargo build -v --target i686-poky-linux-gnu --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/src/tools/cargo//Cargo.toml
| warning: profiles for the non root package will be ignored, specify profiles at the workspace root:
| package:   /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/src/tools/rls/racer/Cargo.toml
| workspace: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/Cargo.toml
|    Compiling libc v0.2.125
|    Compiling pkg-config v0.3.18
|    Compiling autocfg v1.1.0
|    Compiling proc-macro2 v1.0.37
|    Compiling syn v1.0.91
|    Compiling unicode-xid v0.2.2
|    Compiling cfg-if v1.0.0
|    Compiling serde_derive v1.0.125
|    Compiling memchr v2.4.1
|    Compiling serde v1.0.125
|    Compiling cfg-if v0.1.10
|    Compiling log v0.4.14
|    Compiling matches v0.1.8
|    Compiling bitflags v1.2.1
|    Compiling crc32fast v1.2.0
|    Compiling tinyvec v0.3.4
|    Compiling getrandom v0.2.0
|    Compiling getrandom v0.1.14
|    Compiling percent-encoding v2.1.0
|    Compiling lazy_static v1.4.0
|    Compiling ryu v1.0.5
|    Compiling typenum v1.12.0
|    Compiling once_cell v1.10.0
|    Compiling regex-automata v0.1.10
|    Compiling serde_json v1.0.59
|    Compiling anyhow v1.0.51
|    Compiling itoa v0.4.6
|    Compiling foreign-types-shared v0.1.1
|    Compiling openssl v0.10.38
|    Compiling regex-syntax v0.6.25
|    Compiling curl v0.4.41
|    Compiling crossbeam-utils v0.8.8
|    Compiling ppv-lite86 v0.2.8
|    Compiling openssl-probe v0.1.2
|    Compiling same-file v1.0.6
|    Compiling version_check v0.9.3
|    Compiling byteorder v1.3.4
|    Compiling hashbrown v0.11.2
|    Compiling termcolor v1.1.2
|    Compiling hex v0.3.2
|    Compiling fnv v1.0.7
|    Compiling bytes v1.0.1
|    Compiling remove_dir_all v0.5.3
|    Compiling utf8parse v0.1.1
|    Compiling static_assertions v1.1.0
|    Compiling semver v1.0.3
|    Compiling either v1.6.0
|    Compiling humantime v2.0.1
|    Compiling shell-escape v0.1.5
|    Compiling hex v0.4.2
|    Compiling textwrap v0.14.2
|    Compiling strsim v0.10.0
|    Compiling smallvec v1.7.0
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/libc/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=6a53bcab5e7f1086 -C extra-filename=-6a53bcab5e7f1086 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/libc-6a53bcab5e7f1086 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name pkg_config /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/pkg-config/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=061dcac98c86a1a6 -C extra-filename=-061dcac98c86a1a6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name autocfg /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/autocfg/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=1aa4d3f07cc4e07f -C extra-filename=-1aa4d3f07cc4e07f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/proc-macro2/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=87efd0f485aac3f7 -C extra-filename=-87efd0f485aac3f7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/proc-macro2-87efd0f485aac3f7 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/syn/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="extra-traits"' --cfg 'feature="fold"' --cfg 'feature="full"' --cfg 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"' --cfg 'feature="quote"' --cfg 'feature="visit"' --cfg 'feature="visit-mut"' -C metadata=724a8f39eceb6209 -C extra-filename=-724a8f39eceb6209 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/syn-724a8f39eceb6209 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.
 1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=e36b28e90b57bbbb -C extra-filename=-e36b28e90b57bbbb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=be172dd6f726ee09 -C extra-filename=-be172dd6f726ee09 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/
 build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/serde_derive-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=80c2e3d0fcd93c2c -C extra-filename=-80c2e3d0fcd93c2c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/serde_derive-80c2e3d0fcd93c2c -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/memchr/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=7870bbea573279f6 -C extra-filename=-7870bbea573279f6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/memchr-7870bbea573279f6 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/serde-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"' --cfg 'feature="std"' -C metadata=10db6ad5aab3d536 -C extra-filename=-10db6ad5aab3d536 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/serde-10db6ad5aab3d536 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=1ddaf75e610967ac -C extra-filename=-1ddaf75e610967ac --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.6
 2.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/log-0.4.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=b77dc3bc9831a0ae -C extra-filename=-b77dc3bc9831a0ae --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/log-b77dc3bc9831a0ae -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name matches /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/matches-0.1.8/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a9496b1cbf235c96 -C extra-filename=-a9496b1cbf235c96 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/bitflags-1.2.1/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=7bbc0f588b0f69fa -C extra-filename=-7bbc0f588b0f69fa --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/bitflags-7bbc0f588b0f69fa -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/crc32fast-1.2.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=00a268ab5c13e0c5 -C extra-filename=-00a268ab5c13e0c5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/crc32fast-00a268ab5c13e0c5 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name tinyvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/tinyvec-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' -C metadata=f4f9ae39c0a45ffb -C extra-filename=-f4f9ae39c0a45ffb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build
 /build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/getrandom/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=b86076861547a624 -C extra-filename=-b86076861547a624 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/getrandom-b86076861547a624 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/getrandom-0.1.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=dec24f6315e6ea6a -C extra-filename=-dec24f6315e6ea6a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/getrandom-dec24f6315e6ea6a -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
| warning: target json file contains unused fields: has-elf-tls
| 
|      Running `rustc --crate-name percent_encoding /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/percent-encoding/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=59b33ce7ddc024f7 -C extra-filename=-59b33ce7ddc024f7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name lazy_static /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/lazy_static/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4f748b1a8d3b90a2 -C extra-filename=-4f748b1a8d3b90a2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/ryu-1.0.5/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=1a5418eaeb37b5fc -C extra-filename=-1a5418eaeb37b5fc --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/ryu-1a5418eaeb37b5fc -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_main /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/typenum/build/main.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c92f2cde8da31609 -C extra-filename=-c92f2cde8da31609 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/typenum-c92f2cde8da31609 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name once_cell --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/once_cell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' --cfg 'feature="race"' --cfg 'feature="std"' -C metadata=5ecb1490d9920b66 -C extra-filename=-5ecb1490d9920b66 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L depend
 ency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name regex_automata /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/regex-automata/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=156593b88956e205 -C extra-filename=-156593b88956e205 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/serde_json-1.0.59/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="raw_value"' --cfg 'feature="std"' --cfg 'feature="unbounded_depth"' -C metadata=b3979dfdde93dcf5 -C extra-filename=-b3979dfdde93dcf5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/serde_json-b3979dfdde93dcf5 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/anyhow-1.0.51/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=6615ac9d36b74b86 -C extra-filename=-6615ac9d36b74b86 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/anyhow-6615ac9d36b74b86 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name itoa /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/itoa-0.4.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=219270b76377b72b -C extra-filename=-219270b76377b72b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/
 release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name foreign_types_shared /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/foreign-types-shared/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=fef5eef34c17391c -C extra-filename=-fef5eef34c17391c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/car
 go/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=b1cf588baae990ce -C extra-filename=-b1cf588baae990ce --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/openssl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=6890e45cdecd62d7 -C extra-filename=-6890e45cdecd62d7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/openssl-6890e45cdecd62d7 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name regex_syntax --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/regex-syntax/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="unicode"' --cfg 'feature="unicode-age"' --cfg 'feature="unicode-bool"' --cfg 'feature="unicode-case"' --cfg 'feature="unicode-gencat"' --cfg 'feature="unicode-perl"' --cfg 'feature="unicode-script"' --cfg 'feature="unicode-segment"' -C metadata=b4085a487aea09ff -C extra-filename=-b4085a487aea09ff --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrap
 per/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=a21a27b147eb9fb1 -C extra-filename=-a21a27b147eb9fb1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/curl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="http2"' --cfg 'feature="openssl-probe"' --cfg 'feature="openssl-sys"' --cfg 'feature="ssl"' -C metadata=46eddc0e4f317253 -C extra-filename=-46eddc0e4f317253 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/curl-46eddc0e4f317253 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints all
 ow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/crossbeam-utils/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=266d0ef7b180e299 -C extra-filename=-266d0ef7b180e299 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/crossbeam-utils-266d0ef7b180e299 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/unicode-xid/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=783807addeb41b7b -C extra-filename=-783807addeb41b7b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l
 inux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name ppv_lite86 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/ppv-lite86/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="simd"' --cfg 'feature="std"' -C metadata=acb00890ff0d30d4 -C extra-filename=-acb00890ff0d30d4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name openssl_probe /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/openssl-probe/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=01bd4a743a34dcd1 -C extra-filename=-01bd4a743a34dcd1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/b
 uild/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name same_file --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/same-file/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e162cd9d21e00af8 -C extra-filename=-e162cd9d21e00af8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62
 .1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `matches` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name version_check /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/version_check-0.9.3/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=fccba6853f9fa51b -C extra-filename=-fccba6853f9fa51b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/byteorder/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=1d271265d9346464 -C extra-filename=-1d271265d9346464 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/byteorder-1d271265d9346464 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name hashbrown --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/hashbrown-0.11.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="raw"' -C metadata=af5e5eec4b0d1112 -C extra-filename=-af5e5eec4b0d1112 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name termcolor --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/termcolor/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=69208d03f0aa2bec -C extra-filename=-69208d03f0aa2bec --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62
 .1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name hex /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/hex-0.3.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=bbaab77a16fc87ca -C extra-filename=-bbaab77a16fc87ca --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name fnv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/fnv/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=453352ec11b37ebf -C extra-filename=-453352ec11b37ebf --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky
 -linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=2004428aee218d35 -C extra-filename=-2004428aee218d35 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name remove_dir_all /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/remove_dir_all/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=b8039be4bb3957a0 -C extra-filename=-b8039be4bb3957a0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name utf8parse /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/utf8parse/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=68de01f2b6969727 -C extra-filename=-68de01f2b6969727 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/tar
 get/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name static_assertions /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/static_assertions/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5f46ff06c92392e2 -C extra-filename=-5f46ff06c92392e2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.6
 2.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/semver-1.0.3/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="serde"' --cfg 'feature="std"' -C metadata=1d0b63520823b33c -C extra-filename=-1d0b63520823b33c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/semver-1d0b63520823b33c -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name either /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/either-1.6.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=437234c7f9ad5e0c -C extra-filename=-437234c7f9ad5e0c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/tar
 get/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name humantime --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/humantime/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e14e1d388357b212 -C extra-filename=-e14e1d388357b212 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62
 .1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name shell_escape /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/shell-escape/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e55007130fff0c54 -C extra-filename=-e55007130fff0c54 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/bui
 ld/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `foreign-types-shared` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name hex --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/hex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=f998e9f57d11b058 -C extra-filename=-f998e9f57d11b058 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name textwrap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/textwrap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c9e6bf50844d5bad -C extra-filename=-c9e6bf50844d5bad --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1
 -r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name strsim /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/strsim/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=dfa530dfad94ef4c -C extra-filename=-dfa530dfad94ef4c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name smallvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/smallvec-1.7.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="may_dangle"' --cfg 'feature="union"' -C metadata=4f7c5aef921d0039 -C extra-filename=-4f7c5aef921d0039 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|    Compiling pathdiff v0.2.1
|    Compiling bytesize v1.0.1
|    Compiling home v0.5.3
|    Compiling unicode-width v0.1.8
| warning: `lazy_static` (lib) generated 2 warnings (2 duplicates)
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
| warning: `cfg-if` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name pathdiff --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/pathdiff/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=3d73ee2d982467b4 -C extra-filename=-3d73ee2d982467b4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1
 -r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name bytesize /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/bytesize/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d571115e32669c7a -C extra-filename=-d571115e32669c7a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name home --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/home/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8f7ab7d7a2f52e49 -C extra-filename=-8f7ab7d7a2f52e49 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/buil
 d/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|    Compiling lazycell v1.3.0
|    Compiling glob v0.3.0
|    Compiling unicode-bidi v0.3.4
|    Compiling foreign-types v0.3.2
|      Running `rustc --crate-name unicode_width /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/unicode-width/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=fe624b1f2e03872c -C extra-filename=-fe624b1f2e03872c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `remove_dir_all` (lib) generated 2 warnings (2 duplicates)
| warning: `static_assertions` (lib) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name lazycell /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/lazycell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8f824b59a64447e0 -C extra-filename=-8f824b59a64447e0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name glob /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/glob/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=0374960beaec534e -C extra-filename=-0374960beaec534e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/releas
 e/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|    Compiling kstring v2.0.0
|      Running `rustc --crate-name unicode_bidi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/unicode-bidi-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=82367145c6c0aa20 -C extra-filename=-82367145c6c0aa20 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3
 2-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libmatches-a9496b1cbf235c96.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name foreign_types /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/foreign-types/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=82b4bb7a5855a02c -C extra-filename=-82b4bb7a5855a02c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/b
 uild/target/release/deps --extern foreign_types_shared=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libforeign_types_shared-fef5eef34c17391c.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|     Building [>                         ] 10/195: syn(build.rs), log(build....
|      Running `rustc --crate-name kstring --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/kstring/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="max_inline"' --cfg 'feature="std"' --cfg 'feature="unsafe"' -C metadata=2a76b4ee0472a8d1 -C extra-filename=-2a76b4ee0472a8d1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dep
 endency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern static_assertions=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libstatic_assertions-5f46ff06c92392e2.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `fnv` (lib) generated 2 warnings (2 duplicates)
|     Building [>                         ] 11/195: syn(build.rs), log(build....
| warning: `foreign-types` (lib) generated 2 warnings (2 duplicates)
|    Compiling walkdir v2.3.2
|     Building [>                         ] 12/195: syn(build.rs), log(build....
|      Running `rustc --crate-name walkdir --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/walkdir/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=6950f27c0a0097a5 -C extra-filename=-6950f27c0a0097a5 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r
 0/build/target/release/deps --extern same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libsame_file-e162cd9d21e00af8.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `pathdiff` (lib) generated 2 warnings (2 duplicates)
|    Compiling vte v0.3.3
|     Building [>                         ] 13/195: syn(build.rs), log(build....
|      Running `rustc --crate-name vte /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/vte/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=f07f2274acfa4cc1 -C extra-filename=-f07f2274acfa4cc1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/
 deps --extern utf8parse=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libutf8parse-68de01f2b6969727.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `unicode-xid` (lib) generated 2 warnings (2 duplicates)
|    Compiling form_urlencoded v1.0.1
|     Building [>                         ] 14/195: syn(build.rs), log(build....
|      Running `rustc --crate-name form_urlencoded --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/form_urlencoded/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=480a5adba05b9fb7 -C extra-filename=-480a5adba05b9fb7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/cargo/1.62.1-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libmatches-a9496b1cbf235c96.rmeta --extern percent_encoding=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libpercent_encoding-59b33ce7ddc024f7.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `itoa` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 15/195: syn(build.rs), log(build....
| warning: `utf8parse` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 16/195: syn(build.rs), log(build....
| warning: `unicode-width` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 17/195: syn(build.rs), log(build....
| warning: `lazycell` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 18/195: syn(build.rs), log(build....
| warning: `either` (lib) generated 2 warnings (2 duplicates)
|    Compiling itertools v0.10.1
|     Building [=>                        ] 19/195: syn(build.rs), log(build....
|      Running `rustc --crate-name itertools --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/itertools-0.10.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_alloc"' --cfg 'feature="use_std"' -C metadata=f3872535dae73d1e -C extra-filename=-f3872535dae73d1e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libeither-437234c7f9ad5e0c.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `bytesize` (lib) generated 2 warnings (2 duplicates)
|    Compiling thread_local v1.1.4
|     Building [=>                        ] 20/195: syn(build.rs), log(build....
|      Running `rustc --crate-name thread_local --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/thread_local/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=a696f0c006efb93b -C extra-filename=-a696f0c006efb93b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/carg
 o/1.62.1-r0/build/target/release/deps --extern once_cell=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libonce_cell-5ecb1490d9920b66.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `same-file` (lib) generated 2 warnings (2 duplicates)
|    Compiling strip-ansi-escapes v0.1.0
|     Building [=>                        ] 21/195: syn(build.rs), log(build....
|      Running `rustc --crate-name strip_ansi_escapes /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/strip-ansi-escapes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5dc2b9c71ebd966b -C extra-filename=-5dc2b9c71ebd966b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .62.1-r0/build/target/release/deps --extern vte=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libvte-f07f2274acfa4cc1.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `vte` (lib) generated 2 warnings (2 duplicates)
|     Building [=>                        ] 22/195: syn(build.rs), log(build....
| warning: `log` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 23/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/log-b77dc3bc9831a0ae/build-script-build`
| warning: `crossbeam-utils` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 24/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/crossbeam-utils-266d0ef7b180e299/build-script-build`
| warning: `curl` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 25/195: syn(build.rs), typenum(bu...
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 26/195: syn(build.rs), typenum(bu...
|     Building [==>                       ] 27/195: syn(build.rs), typenum(bu...
|     Building [==>                       ] 28/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/getrandom-b86076861547a624/build-script-build`
|      Running `rustc --crate-name crossbeam_utils --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/crossbeam-utils/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=b3d1be6828bd9135 -C extra-filename=-b3d1be6828bd9135 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/r
 elease/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libcfg_if-be172dd6f726ee09.rmeta --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/liblazy_static-4f748b1a8d3b90a2.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `strip-ansi-escapes` (lib) generated 2 warnings (2 duplicates)
|     Building [==>                       ] 29/195: syn(build.rs), typenum(bu...
|      Running `rustc --crate-name log /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/log-0.4.14/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=8e2f5c96cda3d506 -C extra-filename=-8e2f5c96cda3d506 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.
 62.1-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libcfg_if-be172dd6f726ee09.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg atomic_cas --cfg has_atomics`
|     Building [===>                      ] 30/195: syn(build.rs), typenum(bu...
| warning: `memchr` (build script) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 31/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/memchr-7870bbea573279f6/build-script-build`
|     Building [===>                      ] 32/195: syn(build.rs), typenum(bu...
|      Running `rustc --crate-name memchr --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/memchr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=17bfd716f2512e90 -C extra-filename=-17bfd716f2512e90 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-
 worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg memchr_runtime_simd --cfg memchr_runtime_sse2 --cfg memchr_runtime_sse42 --cfg memchr_runtime_avx`
| warning: `getrandom` (build script) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 33/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/getrandom-dec24f6315e6ea6a/build-script-build`
| warning: `home` (lib) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 34/195: syn(build.rs), typenum(bu...
|     Building [===>                      ] 35/195: syn(build.rs), typenum(bu...
| warning: `openssl` (build script) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 36/195: syn(build.rs), typenum(bu...
| warning: `once_cell` (lib) generated 2 warnings (2 duplicates)
|     Building [===>                      ] 37/195: syn(build.rs), typenum(bu...
| warning: `openssl-probe` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 38/195: syn(build.rs), typenum(bu...
| warning: `bitflags` (build script) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 39/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/bitflags-7bbc0f588b0f69fa/build-script-build`
|     Building [====>                     ] 40/195: syn(build.rs), typenum(bu...
|      Running `rustc --crate-name bitflags /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/bitflags-1.2.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=57412b919c6d53ac -C extra-filename=-57412b919c6d53ac --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l
 inux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg bitflags_const_fn`
| warning: `kstring` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 41/195: syn(build.rs), typenum(bu...
| warning: `smallvec` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 42/195: syn(build.rs), typenum(bu...
| warning: `crc32fast` (build script) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 43/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/crc32fast-00a268ab5c13e0c5/build-script-build`
| warning: `shell-escape` (lib) generated 2 warnings (2 duplicates)
|     Building [====>                     ] 44/195: syn(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/crc32fast-00a268ab5c13e0c5/build-script-build`
| warning: `serde_derive` (build script) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 45/195: syn(build.rs), crc32fast(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/serde_derive-80c2e3d0fcd93c2c/build-script-build`
| warning: `percent-encoding` (lib) generated 2 warnings (2 duplicates)
|    Compiling unicode-normalization v0.1.13
|     Building [=====>                    ] 46/195: syn(build.rs), crc32fast(...
|      Running `rustc --crate-name unicode_normalization --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/unicode-normalization-0.1.13/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=a1641643346df881 -C extra-filename=-a1641643346df881 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokyb
 uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern tinyvec=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libtinyvec-f4f9ae39c0a45ffb.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|     Building [=====>                    ] 47/195: syn(build.rs), crc32fast(...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=4e797c2f7510f0eb -C extra-filename=-4e797c2f7510f0eb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/r
 elease/deps/libcfg_if-a21a27b147eb9fb1.rmeta --cap-lints allow --cfg crc32fast_stdarchx86`
|     Building [=====>                    ] 48/195: syn(build.rs), typenum(bu...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=5bdf4dec2c8341d4 -C extra-filename=-5bdf4dec2c8341d4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libcfg_if-1ddaf75e610967ac.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg crc32fast_stdarchx86`
| warning: `proc-macro2` (build script) generated 2 warnings (2 duplicates)
| warning: `tinyvec` (lib) generated 2 warnings (2 duplicates)
|     Building [=====>                    ] 50/195: syn(build.rs), typenum(bu...
| warning: `autocfg` (lib) generated 2 warnings (2 duplicates)
|    Compiling indexmap v1.8.0
|     Building [=====>                    ] 52/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/proc-macro2-87efd0f485aac3f7/build-script-build`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/indexmap-1.8.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=63bf466b583a24df -C extra-filename=-63bf466b583a24df --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/indexmap-63bf466b583a24df -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern autocfg=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/
 build/target/release/deps/libautocfg-1aa4d3f07cc4e07f.rlib --cap-lints allow`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/proc-macro2-87efd0f485aac3f7/build-script-build`
| warning: `bitflags` (lib) generated 2 warnings (2 duplicates)
| warning: `serde_json` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 54/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/serde_json-b3979dfdde93dcf5/build-script-build`
| warning: `ryu` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 55/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/ryu-1a5418eaeb37b5fc/build-script-build`
| warning: `serde` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 56/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/serde-10db6ad5aab3d536/build-script-build`
| warning: `libc` (build script) generated 2 warnings (2 duplicates)
|     Building [======>                   ] 57/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/libc-6a53bcab5e7f1086/build-script-build`
|     Building [======>                   ] 58/195: syn(build.rs), typenum(bu...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/libc-6a53bcab5e7f1086/build-script-build`
| warning: `version_check` (lib) generated 2 warnings (2 duplicates)
| warning: `regex-automata` (lib) generated 2 warnings (2 duplicates)
|    Compiling im-rc v15.0.0
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/proc-macro2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=99448f6ce9756dc2 -C extra-filename=-99448f6ce9756dc2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo
 /1.62.1-r0/build/target/release/deps/libunicode_xid-e36b28e90b57bbbb.rmeta --cap-lints allow --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [=======>                  ] 60/195: syn(build.rs), typenum(bu...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/im-rc/./build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=e28d5c1b375a2405 -C extra-filename=-e28d5c1b375a2405 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/im-rc-e28d5c1b375a2405 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps/
 libversion_check-fccba6853f9fa51b.rlib --cap-lints allow`
|     Building [=======>                  ] 61/195: syn(build.rs), typenum(bu...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/proc-macro2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=13295fb71311e19d -C extra-filename=-13295fb71311e19d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/au
 h/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libunicode_xid-783807addeb41b7b.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg use_proc_macro --cfg wrap_proc_macro`
| warning: `syn` (build script) generated 2 warnings (2 duplicates)
|      Running `rustc --crate-name ryu --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/ryu-1.0.5/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4621ad23e0c7216c -C extra-filename=-4621ad23e0c7216c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/
 build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg integer128 --cfg maybe_uninit`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/syn-724a8f39eceb6209/build-script-build`
|     Building [=======>                  ] 65/195: typenum(build.rs), hashbr...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/syn-724a8f39eceb6209/build-script-build`
|     Building [=======>                  ] 67/195: typenum(build.rs), hashbr...
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/libc/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=9ecd3e39fba6a196 -C extra-filename=-9ecd3e39fba6a196 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg libc_int128 --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of --cfg libc_underscore_const_names`
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/libc/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=81ad9eea7305b74a -C extra-filename=-81ad9eea7305b74a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align -
 -cfg libc_int128 --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of --cfg libc_underscore_const_names`
| warning: `ppv-lite86` (lib) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 68/195: typenum(build.rs), hashbr...
| warning: `semver` (build script) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 69/195: typenum(build.rs), hashbr...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/semver-1d0b63520823b33c/build-script-build`
|     Building [========>                 ] 70/195: typenum(build.rs), hashbr...
| warning: `anyhow` (build script) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 71/195: typenum(build.rs), hashbr...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/anyhow-6615ac9d36b74b86/build-script-build`
| error[E0463]: can't find crate for `proc_macro`
|    --> /usr/src/debug/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/proc-macro2/src/lib.rs:119:1
|     |
| 119 | extern crate proc_macro;
|     | ^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
| 
|     Building [========>                 ] 72/195: typenum(build.rs), hashbr...
| warning: `form_urlencoded` (lib) generated 2 warnings (2 duplicates)
|     Building [========>                 ] 74/195: typenum(build.rs), hashbr...
| warning: `byteorder` (build script) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 75/195: typenum(build.rs), hashbr...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/byteorder-1d271265d9346464/build-script-build`
|     Building [=========>                ] 76/195: typenum(build.rs), hashbr...
|      Running `rustc --crate-name anyhow --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/anyhow-1.0.51/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=5e22857ce0eb9d02 -C extra-filename=-5e22857ce0eb9d02 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg backtrace`
|     Building [=========>                ] 77/195: typenum(build.rs), hashbr...
|      Running `rustc --crate-name byteorder /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/byteorder/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=92485ab898323141 -C extra-filename=-92485ab898323141 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg byteorder_i128`
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 78/195: typenum(build.rs), hashbr...
| warning: `humantime` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 79/195: typenum(build.rs), hashbr...
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 80/195: typenum(build.rs), hashbr...
| warning: `pkg-config` (lib) generated 2 warnings (1 duplicate)
|     Building [=========>                ] 81/195: typenum(build.rs), hashbr...
| warning: `indexmap` (build script) generated 2 warnings (2 duplicates)
|     Building [=========>                ] 82/195: typenum(build.rs), hashbr...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/indexmap-63bf466b583a24df/build-script-build`
| warning: `thread_local` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 83/195: typenum(build.rs), hashbr...
|     Building [==========>               ] 84/195: typenum(build.rs), hashbr...
| warning: `crc32fast` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 85/195: typenum(build.rs), hashbr...
|    Compiling bstr v0.2.13
|    Compiling aho-corasick v0.7.18
|    Compiling combine v4.6.3
|    Compiling os_str_bytes v6.0.0
|      Running `rustc --crate-name bstr /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/bstr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="regex-automata"' --cfg 'feature="std"' --cfg 'feature="unicode"' -C metadata=bda8cd54378e7566 -C extra-filename=-bda8cd54378e7566 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/relea
 se/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/liblazy_static-4f748b1a8d3b90a2.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-17bfd716f2512e90.rmeta --extern regex_automata=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libregex_automata-156593b88956e205.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name aho_corasick --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/aho-corasick/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=783423dc35e8efc6 -C extra-filename=-783423dc35e8efc6 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-17bfd716f2512e90.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|      Running `rustc --crate-name combine --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/combine/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="bytes"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=44179cf586534114 -C extra-filename=-44179cf586534114 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependenc
 y=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern bytes=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libbytes-2004428aee218d35.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-17bfd716f2512e90.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
|     Building [==========>               ] 85/195: aho-corasick, typenum(bui...
|      Running `rustc --crate-name os_str_bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/os_str_bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="memchr"' --cfg 'feature="raw_os_str"' -C metadata=5b6b7ee9c39abc1c -C extra-filename=-5b6b7ee9c39abc1c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/hom
 e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-17bfd716f2512e90.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0`
| warning: `typenum` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 86/195: aho-corasick, hashbrown, ...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/typenum-c92f2cde8da31609/build-script-main`
| warning: `textwrap` (lib) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 87/195: aho-corasick, hashbrown, ...
| warning: `im-rc` (build script) generated 2 warnings (2 duplicates)
|     Building [==========>               ] 88/195: aho-corasick, hashbrown, ...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/build/im-rc-e28d5c1b375a2405/build-script-build`
|     Building [==========>               ] 89/195: aho-corasick, hashbrown, ...
| warning: `ryu` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 90/195: aho-corasick, hashbrown, ...
|      Running `rustc --crate-name indexmap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/indexmap-1.8.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=1c1f0b2dc8021eba -C extra-filename=-1c1f0b2dc8021eba --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern hashbrown=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libhashbrown-af5e5eec4b0d1112.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg has_std --cfg rustc_1_51`
| warning: `log` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 91/195: aho-corasick, hashbrown, ...
| warning: `hashbrown` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 92/195: aho-corasick, byteorder, ...
| For more information about this error, try `rustc --explain E0463`.
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
| error: could not compile `proc-macro2` due to previous error; 2 warnings emitted
| 
| Caused by:
|   process didn't exit successfully: `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/vendor/proc-macro2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=13295fb71311e19d -C extra-filename=-13295fb71311e19d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/po
 kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/build/target/i686-poky-linux-gnu/release/deps/libunicode_xid-783807addeb41b7b.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0=/usr/src/debug/cargo/1.62.1-r0 --cfg use_proc_macro --cfg wrap_proc_macro` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [===========>              ] 93/195: aho-corasick, byteorder, ...
|     Building [===========>              ] 94/195: aho-corasick, byteorder, ...
| warning: `hex` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 95/195: aho-corasick, byteorder, ...
| warning: `walkdir` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 96/195: aho-corasick, byteorder, ...
| warning: `termcolor` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>              ] 97/195: aho-corasick, byteorder, ...
| warning: `os_str_bytes` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 98/195: aho-corasick, byteorder, ...
| warning: `byteorder` (lib) generated 2 warnings (2 duplicates)
|     Building [============>             ] 99/195: aho-corasick, libc, strsi...
| warning: `bytes` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>             ] 100/195: aho-corasick, libc, strsi...
| warning: `strsim` (lib) generated 2 warnings (2 duplicates)
|     Building [===========>             ] 101/195: aho-corasick, libc, cross...
| warning: `unicode-bidi` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 102/195: aho-corasick, libc, cross...
| warning: `crossbeam-utils` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 103/195: aho-corasick, libc, combi...
| warning: `anyhow` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 104/195: aho-corasick, libc, combi...
| warning: `proc-macro2` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 105/195: aho-corasick, libc, combi...
| warning: `memchr` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 106/195: aho-corasick, libc, combi...
| warning: `glob` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 107/195: aho-corasick, libc, combi...
| warning: `indexmap` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 108/195: aho-corasick, libc, combi...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 109/195: aho-corasick, combine, un...
| warning: `libc` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 110/195: aho-corasick, combine, un...
| warning: `unicode-normalization` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 111/195: aho-corasick, combine, re...
| warning: `bstr` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 112/195: aho-corasick, combine, re...
| warning: `aho-corasick` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 113/195: combine, regex-syntax, it...
| warning: `itertools` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 114/195: combine, regex-syntax
| warning: `regex-syntax` (lib) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 115/195: combine
| warning: `combine` (lib) generated 2 warnings (2 duplicates)
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/run.do_compile.3225038:171 exit 101 from '"cargo" build -v --target i686-poky-linux-gnu --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/rustc-1.62.1-src/src/tools/cargo//Cargo.toml "$@"'
| WARNING: Backtrace (BB generated script):
| 	#1: oe_cargo_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/run.do_compile.3225038, line 171
| 	#2: cargo_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/run.do_compile.3225038, line 161
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/run.do_compile.3225038, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/run.do_compile.3225038, line 203
NOTE: recipe cargo-1.62.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 843 tasks of which 752 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cargo-1.62.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/run.do_compile.3225038', 101, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.62.1-r0/temp/log.do_compile.3225038
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.1.bb:do_compile) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3333025884009532084==--

