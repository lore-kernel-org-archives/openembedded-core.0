Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8899AC48BDF
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.343.1664643226842995504
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kZY6Zrgz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101839477d913-b049f651-f7dd-450a-9adc-409eeb9cd356-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DTy/o1wEOJLIG9uQc2Trzvs6nlD6EbomxZDo24rhLNQ=;
	b=kZY6ZrgzL/a6Nu+4WbxQHp0exEbTs3J0CmuN7SaFYU8HieIbTmHM+6Rh6WIgpTyU
	tNMVZ4yw6xYIiCYdVHxFKvwiiRlIz8MLb4m4AupHY+Lne9055Lr5P9C6TYcl5QptWot
	IfhWZcXsQC7VchD8lL3gMyhN+Sxd5XWp2hahjDzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DTy/o1wEOJLIG9uQc2Trzvs6nlD6EbomxZDo24rhLNQ=;
	b=FclS4/UzZC+3Zs0SMt7bLVi1nFmrFWbCAOOkE/UNZyycgsJPchre0BogJWHxGvV2
	YV2hcNtCmeWxJWytz+aLul0+BdC7BfxCRJZs8E4nXakZUsT8cxOXLflQPAvonzoopaR
	1JDRe2QO2//gRdU3GJKjQLrpi/+Jz9B38iF0AsMA=
Content-Type: multipart/mixed; boundary="===============7376122652102210221=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.64.0 FAILED
Message-ID: 
 <010101839477d913-b049f651-f7dd-450a-9adc-409eeb9cd356-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171273

--===============7376122652102210221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.64.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:38097b9714dfaadf0b4442910d9dc92f4bb7f5a0"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 28 Mirrors 0 Missed 38 Current 143 (42% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 182 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 186 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 193 of 209 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 566 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_fetch)
NOTE: Running task 567 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_fetch)
NOTE: Running task 586 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 588 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 589 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_fetch)
NOTE: Running task 590 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 591 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_fetch)
NOTE: Running task 594 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 595 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: Running task 620 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_fetch)
NOTE: Running task 622 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_fetch)
NOTE: Running task 630 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Started
NOTE: recipe cargo-1.63.0-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_fetch: Started
NOTE: recipe readline-native-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 631 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe rust-native-1.63.0-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_fetch: Started
NOTE: Running task 632 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_fetch: Succeeded
NOTE: Running task 633 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_unpack)
NOTE: recipe ca-certificates-native-20211016-r0: task do_fetch: Succeeded
NOTE: Running task 634 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 635 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: Running task 657 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-native-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 735 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 736 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 737 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 738 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.85.0-r0: task do_unpack: Succeeded
NOTE: Running task 739 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_patch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_unpack: Succeeded
NOTE: Running task 740 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.85.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Started
NOTE: recipe curl-7.85.0-r0: task do_patch: Succeeded
NOTE: Running task 741 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 742 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ca-certificates-native-20211016-r0: task do_patch: Succeeded
NOTE: Running task 743 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 744 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_configure: Succeeded
NOTE: Running task 745 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_compile: Succeeded
NOTE: Running task 746 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 747 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 748 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 749 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 750 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 751 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-native-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 752 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 753 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 754 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-native-20211016-r0: task do_install: Succeeded
NOTE: Running task 755 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_populate_sysroot)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 756 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-native-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 757 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Started
NOTE: recipe ca-certificates-native-20211016-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_fetch: Succeeded
NOTE: Running task 758 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_unpack)
NOTE: Running task 759 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_unpack)
NOTE: Running task 760 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cargo-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.63.0-r0: task do_fetch: Succeeded
NOTE: Running task 761 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_unpack)
NOTE: Running task 762 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_unpack)
NOTE: Running task 763 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_unpack)
NOTE: recipe cargo-1.63.0-r0: task do_unpack: Started
NOTE: recipe rust-native-1.63.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_unpack: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 764 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 765 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 766 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 767 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Succeeded
NOTE: Running task 768 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_patch)
NOTE: recipe libstd-rs-1.63.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_patch: Succeeded
NOTE: Running task 769 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 770 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.63.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 771 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-native-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 772 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 773 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 774 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 775 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 776 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 777 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_unpack: Succeeded
NOTE: Running task 778 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_patch)
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_patch: Succeeded
NOTE: Running task 779 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_generate_toolchain_file)
NOTE: Running task 780 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 781 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_configure)
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 782 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_configure: Succeeded
NOTE: Running task 783 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_compile)
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_compile: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_patch)
NOTE: Running task 785 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-native-1.63.0-r0: task do_patch: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_patch: Succeeded
NOTE: Running task 786 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 787 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_rust_gen_targets)
NOTE: recipe cargo-native-1.63.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_rust_gen_targets: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe cargo-native-1.63.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-native-1.63.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe rust-native-1.63.0-r0: task do_unpack: Succeeded
NOTE: Running task 788 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_patch)
NOTE: Running task 789 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.63.0-r0: task do_patch: Started
NOTE: recipe rust-native-1.63.0-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.63.0-r0: task do_patch: Succeeded
NOTE: Running task 790 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 791 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.63.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.63.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.63.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.63.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cargo-1.63.0-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_patch)
NOTE: Running task 793 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_cargo_setup_snapshot)
NOTE: recipe cargo-1.63.0-r0: task do_patch: Started
NOTE: recipe cargo-1.63.0-r0: task do_cargo_setup_snapshot: Started
NOTE: recipe cargo-1.63.0-r0: task do_patch: Succeeded
NOTE: Running task 794 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 795 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_rust_gen_targets)
NOTE: Running task 796 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_populate_lic)
NOTE: recipe cargo-1.63.0-r0: task do_populate_lic: Started
NOTE: recipe cargo-1.63.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-1.63.0-r0: task do_rust_gen_targets: Started
NOTE: recipe cargo-1.63.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe cargo-1.63.0-r0: task do_populate_lic: Succeeded
NOTE: recipe cargo-1.63.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.63.0-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe cargo-1.63.0-r0: task do_cargo_setup_snapshot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 797 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 798 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 799 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 800 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 801 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_configure)
NOTE: recipe libidn2-2.3.3-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 802 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 803 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_compile)
NOTE: recipe libidn2-2.3.3-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 804 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_install)
NOTE: recipe libidn2-2.3.3-r0: task do_install: Started
NOTE: recipe libidn2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 805 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 806 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_package)
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 807 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.85.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 808 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_configure)
NOTE: recipe curl-7.85.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 809 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_configure: Succeeded
NOTE: Running task 810 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_configure_ptest_base)
NOTE: recipe curl-7.85.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-7.85.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 811 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_compile)
NOTE: recipe curl-7.85.0-r0: task do_compile: Started
NOTE: recipe curl-7.85.0-r0: task do_compile: Succeeded
NOTE: Running task 812 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_compile_ptest_base)
NOTE: recipe curl-7.85.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-7.85.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 813 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_install)
NOTE: recipe curl-7.85.0-r0: task do_install: Started
NOTE: recipe curl-7.85.0-r0: task do_install: Succeeded
NOTE: Running task 814 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_install_ptest_base)
NOTE: recipe curl-7.85.0-r0: task do_install_ptest_base: Started
NOTE: recipe curl-7.85.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 815 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot)
NOTE: Running task 816 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_package)
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.85.0-r0: task do_package: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_compile: Succeeded
NOTE: Running task 817 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_install)
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_install: Started
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_install: Succeeded
NOTE: Running task 818 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb:do_populate_sysroot)
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.85.0-r0: task do_package: Succeeded
NOTE: Running task 819 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata)
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-llvm-native-1.63.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 820 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rust-native-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 821 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_rust_create_wrappers)
NOTE: recipe rust-native-1.63.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe rust-native-1.63.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 822 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_configure)
NOTE: recipe rust-native-1.63.0-r0: task do_configure: Started
NOTE: recipe rust-native-1.63.0-r0: task do_configure: Succeeded
NOTE: Running task 823 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_compile)
NOTE: recipe rust-native-1.63.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_compile
NOTE: recipe rust-native-1.63.0-r0: task do_compile: Succeeded
NOTE: Running task 824 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_install)
NOTE: recipe rust-native-1.63.0-r0: task do_install: Started
NOTE: recipe rust-native-1.63.0-r0: task do_install: Succeeded
NOTE: Running task 825 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.63.0.bb:do_populate_sysroot)
NOTE: recipe rust-native-1.63.0-r0: task do_populate_sysroot: Started
NOTE: recipe rust-native-1.63.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 826 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-native-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 827 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.63.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 828 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_configure)
NOTE: recipe cargo-native-1.63.0-r0: task do_configure: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_configure: Succeeded
NOTE: Running task 829 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_compile)
NOTE: recipe cargo-native-1.63.0-r0: task do_compile: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_compile: Succeeded
NOTE: Running task 830 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_install)
NOTE: recipe cargo-native-1.63.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_install: Succeeded
NOTE: Running task 831 of 850 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.63.0-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.63.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 832 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 833 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.63.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 834 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_configure)
NOTE: recipe libstd-rs-1.63.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_configure: Succeeded
NOTE: Running task 835 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_compile)
NOTE: recipe libstd-rs-1.63.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_compile: Succeeded
NOTE: Running task 836 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_install)
NOTE: recipe libstd-rs-1.63.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_install: Succeeded
NOTE: Running task 837 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_populate_sysroot)
NOTE: Running task 838 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_package)
NOTE: recipe libstd-rs-1.63.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 839 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 840 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-1.63.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-1.63.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 841 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_configure)
NOTE: recipe cargo-1.63.0-r0: task do_configure: Started
NOTE: recipe cargo-1.63.0-r0: task do_configure: Succeeded
NOTE: Running task 842 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_compile)
NOTE: recipe cargo-1.63.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_package: Succeeded
NOTE: Running task 843 of 850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.63.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: Using rust targets from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rust-targets/
| NOTE: cargo = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot-native/usr/bin/cargo
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
| NOTE: cargo build -v --target i686-poky-linux-gnu --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/src/tools/cargo//Cargo.toml
|    Compiling libc v0.2.126
|    Compiling pkg-config v0.3.18
|    Compiling proc-macro2 v1.0.37
|    Compiling autocfg v1.1.0
|    Compiling unicode-xid v0.2.2
|    Compiling syn v1.0.91
|    Compiling cfg-if v1.0.0
|    Compiling serde_derive v1.0.125
|    Compiling serde v1.0.125
|    Compiling cfg-if v0.1.10
|    Compiling memchr v2.4.1
|    Compiling version_check v0.9.3
|    Compiling log v0.4.14
|    Compiling bitflags v1.2.1
|    Compiling crc32fast v1.2.0
|    Compiling matches v0.1.8
|    Compiling tinyvec v0.3.4
|    Compiling once_cell v1.12.0
|    Compiling getrandom v0.2.0
|    Compiling getrandom v0.1.14
|    Compiling lazy_static v1.4.0
|    Compiling ryu v1.0.5
|    Compiling percent-encoding v2.1.0
|    Compiling serde_json v1.0.59
|    Compiling typenum v1.12.0
|    Compiling regex-automata v0.1.10
|    Compiling anyhow v1.0.51
|    Compiling foreign-types-shared v0.1.1
|    Compiling crossbeam-utils v0.8.8
|    Compiling ppv-lite86 v0.2.8
|    Compiling hashbrown v0.12.3
|    Compiling curl v0.4.43
|    Compiling itoa v0.4.6
|    Compiling regex-syntax v0.6.25
|    Compiling openssl-probe v0.1.2
|    Compiling openssl v0.10.38
|    Compiling same-file v1.0.6
|    Compiling os_str_bytes v6.0.0
|    Compiling termcolor v1.1.2
|    Compiling heck v0.4.0
|    Compiling byteorder v1.3.4
|    Compiling remove_dir_all v0.5.3
|    Compiling strsim v0.10.0
|    Compiling semver v1.0.3
|    Compiling hex v0.3.2
|    Compiling utf8parse v0.1.1
|    Compiling fnv v1.0.7
|    Compiling bytes v1.0.1
|    Compiling textwrap v0.15.0
|    Compiling either v1.6.0
|    Compiling static_assertions v1.1.0
|    Compiling hex v0.4.2
|    Compiling smallvec v1.8.1
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/libc/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=cdd8189d413eab78 -C extra-filename=-cdd8189d413eab78 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/libc-cdd8189d413eab78 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name pkg_config /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/pkg-config/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=2ea727a1b77a484c -C extra-filename=-2ea727a1b77a484c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro2-1.0.37/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=3d7015700e24e8ca -C extra-filename=-3d7015700e24e8ca --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro2-3d7015700e24e8ca -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name autocfg /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/autocfg/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=168ce7056595053a -C extra-filename=-168ce7056595053a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/unicode-xid-0.2.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=2f740e06e11340aa -C extra-filename=-2f740e06e11340aa --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/syn-1.0.91/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="extra-traits"' --cfg 'feature="fold"' --cfg 'feature="full"' --cfg 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"' --cfg 'feature="quote"' --cfg 'feature="visit"' --cfg 'feature="visit-mut"' -C metadata=ff848330357a271f -C extra-filename=-ff848330357a271f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/syn-ff848330357a271f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/carg
 o/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e664940fd7b9cb80 -C extra-filename=-e664940fd7b9cb80 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/
 build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/serde_derive-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=7fa9324567ec7678 -C extra-filename=-7fa9324567ec7678 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/serde_derive-7fa9324567ec7678 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/serde-1.0.125/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"' --cfg 'feature="std"' -C metadata=44197ea7c70eb389 -C extra-filename=-44197ea7c70eb389 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/serde-44197ea7c70eb389 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e5069094d9b82b92 -C extra-filename=-e5069094d9b82b92 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.6
 3.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/memchr-2.4.1/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=08cc36daf1eb302b -C extra-filename=-08cc36daf1eb302b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/memchr-08cc36daf1eb302b -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name version_check /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/version_check-0.9.3/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=bc3b18b8fd009818 -C extra-filename=-bc3b18b8fd009818 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/log-0.4.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=8ce7e4bb1f1134e0 -C extra-filename=-8ce7e4bb1f1134e0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/log-8ce7e4bb1f1134e0 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/bitflags-1.2.1/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=5769edfbfae4589d -C extra-filename=-5769edfbfae4589d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/bitflags-5769edfbfae4589d -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/crc32fast-1.2.0/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=f09f15bbd97263a0 -C extra-filename=-f09f15bbd97263a0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/crc32fast-f09f15bbd97263a0 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name matches /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/matches-0.1.8/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5181d423b4447cec -C extra-filename=-5181d423b4447cec --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name tinyvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/tinyvec-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' -C metadata=f8669d851db5ed2e -C extra-filename=-f8669d851db5ed2e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build
 /build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name once_cell --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/once_cell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="default"' --cfg 'feature="race"' --cfg 'feature="std"' -C metadata=d710c5944ffb758e -C extra-filename=-d710c5944ffb758e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L depend
 ency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/getrandom/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=5fc73b7a65ab1ea8 -C extra-filename=-5fc73b7a65ab1ea8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/getrandom-5fc73b7a65ab1ea8 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/getrandom-0.1.14/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=c8720cc1dc8edb2e -C extra-filename=-c8720cc1dc8edb2e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/getrandom-c8720cc1dc8edb2e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name lazy_static /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/lazy_static/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d8e008d7ee6c064a -C extra-filename=-d8e008d7ee6c064a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build
 /target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/ryu-1.0.5/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=1cb68d672ad7a65b -C extra-filename=-1cb68d672ad7a65b --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/ryu-1cb68d672ad7a65b -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name percent_encoding /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/percent-encoding/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5318bc1736874c8d -C extra-filename=-5318bc1736874c8d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/serde_json-1.0.59/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="raw_value"' --cfg 'feature="std"' --cfg 'feature="unbounded_depth"' -C metadata=ea1b7eb6eff580e2 -C extra-filename=-ea1b7eb6eff580e2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/serde_json-ea1b7eb6eff580e2 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_main /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/typenum/build/main.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=85294f0eccf3782e -C extra-filename=-85294f0eccf3782e --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/typenum-85294f0eccf3782e -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name regex_automata /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/regex-automata/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ec56312d243b0aa9 -C extra-filename=-ec56312d243b0aa9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/anyhow-1.0.51/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=39e7c6d343c842aa -C extra-filename=-39e7c6d343c842aa --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/anyhow-39e7c6d343c842aa -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/cfg-if-0.1.10/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=1df878b643579860 -C extra-filename=-1df878b643579860 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name foreign_types_shared /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/foreign-types-shared/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=02099f8ff7e95c85 -C extra-filename=-02099f8ff7e95c85 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/car
 go/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/crossbeam-utils/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=2f5c2170e4dfe692 -C extra-filename=-2f5c2170e4dfe692 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/crossbeam-utils-2f5c2170e4dfe692 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name ppv_lite86 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/ppv-lite86/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="simd"' --cfg 'feature="std"' -C metadata=b0cc1112fc2bbd1c -C extra-filename=-b0cc1112fc2bbd1c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name hashbrown --edition=2021 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/hashbrown/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="raw"' -C metadata=1896dd828bfe5be7 -C extra-filename=-1896dd828bfe5be7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32
 -poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name cfg_if --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/cfg-if/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off -C metadata=c5760eedbf77446c -C extra-filename=-c5760eedbf77446c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name unicode_xid /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/unicode-xid-0.2.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=2c90d83903ccd157 -C extra-filename=-2c90d83903ccd157 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/curl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="http2"' --cfg 'feature="openssl-probe"' --cfg 'feature="openssl-sys"' --cfg 'feature="ssl"' -C metadata=cc854cdefe08f7ab -C extra-filename=-cc854cdefe08f7ab --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/curl-cc854cdefe08f7ab -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints all
 ow`
|      Running `rustc --crate-name itoa /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/itoa-0.4.6/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d9c3c88d60d13ecb -C extra-filename=-d9c3c88d60d13ecb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/
 release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name regex_syntax --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/regex-syntax-0.6.25/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="unicode"' --cfg 'feature="unicode-age"' --cfg 'feature="unicode-bool"' --cfg 'feature="unicode-case"' --cfg 'feature="unicode-gencat"' --cfg 'feature="unicode-perl"' --cfg 'feature="unicode-script"' --cfg 'feature="unicode-segment"' -C metadata=086fd2feda755b76 -C extra-filename=-086fd2feda755b76 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-
 r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name openssl_probe /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/openssl-probe/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=08b21fcaa4261b05 -C extra-filename=-08b21fcaa4261b05 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/b
 uild/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/openssl/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=382741b7b574027a -C extra-filename=-382741b7b574027a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/openssl-382741b7b574027a -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name same_file --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/same-file/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=fb3628f1a292d27d -C extra-filename=-fb3628f1a292d27d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63
 .0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name os_str_bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/os_str_bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="raw_os_str"' -C metadata=4268be0f283a1d18 -C extra-filename=-4268be0f283a1d18 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name termcolor --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/termcolor/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=8c47e0b73a67bff2 -C extra-filename=-8c47e0b73a67bff2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63
 .0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name heck --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/heck/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' -C metadata=d9935aa0e76652a2 -C extra-filename=-d9935aa0e76652a2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name build_script_build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/byteorder/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=41f58097cc7dadda -C extra-filename=-41f58097cc7dadda --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/byteorder-41f58097cc7dadda -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name remove_dir_all /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/remove_dir_all/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ed3e3a9ea301fd1d -C extra-filename=-ed3e3a9ea301fd1d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0
 /build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name strsim /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/strsim/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=5e987f2dd189c93f -C extra-filename=-5e987f2dd189c93f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/semver-1.0.3/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="serde"' --cfg 'feature="std"' -C metadata=f2f3c8dcc8d14481 -C extra-filename=-f2f3c8dcc8d14481 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/semver-f2f3c8dcc8d14481 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow`
|      Running `rustc --crate-name hex /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/hex-0.3.2/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ac0ac1cf51c4394a -C extra-filename=-ac0ac1cf51c4394a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/re
 lease/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name utf8parse /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/utf8parse/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=425d7c03ca968340 -C extra-filename=-425d7c03ca968340 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/tar
 get/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name fnv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/fnv/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=1d8c94cc77689fa2 -C extra-filename=-1d8c94cc77689fa2 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky
 -linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name bytes --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/bytes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=dd4df98ba647020f -C extra-filename=-dd4df98ba647020f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name textwrap --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/textwrap/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=455c793798c0dbe4 -C extra-filename=-455c793798c0dbe4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0
 -r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name either /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/either-1.6.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=40a25a92d855c1e9 -C extra-filename=-40a25a92d855c1e9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/tar
 get/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name static_assertions /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/static_assertions/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=e86ef51d3631d802 -C extra-filename=-e86ef51d3631d802 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.6
 3.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name hex --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/hex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=7b58b7803a68c6de -C extra-filename=-7b58b7803a68c6de --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling shell-escape v0.1.5
|    Compiling humantime v2.0.1
|    Compiling glob v0.3.0
|    Compiling unicode-width v0.1.8
|    Compiling bytesize v1.0.1
|    Compiling pathdiff v0.2.1
|      Running `rustc --crate-name smallvec --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/smallvec/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="may_dangle"' --cfg 'feature="union"' -C metadata=e00ae9f7e1892466 -C extra-filename=-e00ae9f7e1892466 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/
 build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name shell_escape /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/shell-escape/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=1b1cc52a48d736ea -C extra-filename=-1b1cc52a48d736ea --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/bui
 ld/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name humantime --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/humantime/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=96a3bed2a1393f95 -C extra-filename=-96a3bed2a1393f95 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63
 .0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name glob /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/glob/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=9b5720b87510f5da -C extra-filename=-9b5720b87510f5da --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/releas
 e/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name unicode_width /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/unicode-width/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=ea762996ab884c47 -C extra-filename=-ea762996ab884c47 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name bytesize /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/bytesize/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=82e2bf54efd25370 -C extra-filename=-82e2bf54efd25370 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling home v0.5.3
|     Building [                           ] 7/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name pathdiff --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/pathdiff/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=2678bb95960d6082 -C extra-filename=-2678bb95960d6082 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0
 -r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|      Running `rustc --crate-name home --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/home/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=bcf7ec486b914d63 -C extra-filename=-bcf7ec486b914d63 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/buil
 d/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling lazycell v1.3.0
|    Compiling unicode-bidi v0.3.4
|      Running `rustc --crate-name lazycell /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/lazycell/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=ec19abd7f10c9f25 -C extra-filename=-ec19abd7f10c9f25 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/targe
 t/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [>                          ] 9/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name unicode_bidi /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/unicode-bidi-0.3.4/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=3e90ea6312ca5847 -C extra-filename=-3e90ea6312ca5847 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3
 2-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libmatches-5181d423b4447cec.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling foreign-types v0.3.2
|     Building [>                         ] 10/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name foreign_types /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/foreign-types/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d59ddb5d1a7c0d68 -C extra-filename=-d59ddb5d1a7c0d68 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/b
 uild/target/release/deps --extern foreign_types_shared=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libforeign_types_shared-02099f8ff7e95c85.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling kstring v2.0.0
|     Building [>                         ] 11/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name kstring --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/kstring/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="max_inline"' --cfg 'feature="std"' --cfg 'feature="unsafe"' -C metadata=ed3f30bed5df4f05 -C extra-filename=-ed3f30bed5df4f05 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dep
 endency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern static_assertions=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libstatic_assertions-e86ef51d3631d802.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling form_urlencoded v1.0.1
|    Compiling vte v0.3.3
|      Running `rustc --crate-name form_urlencoded --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/form_urlencoded/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4ef30da818c85dac -C extra-filename=-4ef30da818c85dac --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/cargo/1.63.0-r0/build/target/release/deps --extern matches=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libmatches-5181d423b4447cec.rmeta --extern percent_encoding=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libpercent_encoding-5318bc1736874c8d.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [>                         ] 13/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name vte /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/vte/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=205f8e006fd35c46 -C extra-filename=-205f8e006fd35c46 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/
 deps --extern utf8parse=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libutf8parse-425d7c03ca968340.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling walkdir v2.3.2
|     Building [>                         ] 15/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name walkdir --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/walkdir/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=fa61e829ec42b110 -C extra-filename=-fa61e829ec42b110 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r
 0/build/target/release/deps --extern same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libsame_file-fb3628f1a292d27d.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [=>                        ] 16/204: serde_json(build.rs), glo...
|     Building [=>                        ] 17/204: serde_json(build.rs), glo...
|    Compiling itertools v0.10.1
|     Building [=>                        ] 18/204: serde_json(build.rs), glo...
|      Running `rustc --crate-name itertools --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/itertools-0.10.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_alloc"' --cfg 'feature="use_std"' -C metadata=d49e78459c43ac4d -C extra-filename=-d49e78459c43ac4d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libeither-40a25a92d855c1e9.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling thread_local v1.1.4
|     Building [=>                        ] 19/204: thread_local, serde_json(...
|      Running `rustc --crate-name thread_local --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/thread_local/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=d5fd7d1449355fc7 -C extra-filename=-d5fd7d1449355fc7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/carg
 o/1.63.0-r0/build/target/release/deps --extern once_cell=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libonce_cell-d710c5944ffb758e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling strip-ansi-escapes v0.1.0
|     Building [=>                        ] 20/204: thread_local, serde_json(...
|      Running `rustc --crate-name strip_ansi_escapes /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/strip-ansi-escapes/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c4e78a63456383bd -C extra-filename=-c4e78a63456383bd --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1
 .63.0-r0/build/target/release/deps --extern vte=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libvte-205f8e006fd35c46.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling clap_lex v0.2.2
|     Building [=>                        ] 21/204: thread_local, serde_json(...
|      Running `rustc --crate-name clap_lex --edition=2021 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/clap_lex/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=98b06235a4e592c0 -C extra-filename=-98b06235a4e592c0 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0
 -r0/build/target/release/deps --extern os_str_bytes=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libos_str_bytes-4268be0f283a1d18.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [=>                        ] 22/204: thread_local, serde_json(...
|     Building [=>                        ] 23/204: thread_local, serde_json(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/log-8ce7e4bb1f1134e0/build-script-build`
|     Building [==>                       ] 24/204: thread_local, serde_json(...
|     Building [==>                       ] 25/204: thread_local, serde_json(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/crossbeam-utils-2f5c2170e4dfe692/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/getrandom-5fc73b7a65ab1ea8/build-script-build`
|     Building [==>                       ] 26/204: thread_local, serde_json(...
|      Running `rustc --crate-name log /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/log-0.4.14/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="std"' -C metadata=b47f0d7522a7bfc4 -C extra-filename=-b47f0d7522a7bfc4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.
 63.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libcfg_if-e664940fd7b9cb80.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg atomic_cas --cfg has_atomics`
|     Building [==>                       ] 27/204: thread_local, serde_json(...
|     Building [==>                       ] 28/204: thread_local, serde_json(...
|     Building [==>                       ] 29/204: thread_local, serde_json(...
|      Running `rustc --crate-name crossbeam_utils --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/crossbeam-utils/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="nightly"' --cfg 'feature="std"' -C metadata=47429b53d159d645 -C extra-filename=-47429b53d159d645 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/r
 elease/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libcfg_if-e664940fd7b9cb80.rmeta --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/liblazy_static-d8e008d7ee6c064a.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [==>                       ] 30/204: thread_local, serde_json(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/memchr-08cc36daf1eb302b/build-script-build`
|     Building [==>                       ] 31/204: thread_local, serde_json(...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/getrandom-c8720cc1dc8edb2e/build-script-build`
|     Building [===>                      ] 32/204: thread_local, serde_json(...
|     Building [===>                      ] 33/204: thread_local, serde_json(...
|      Running `rustc --crate-name memchr --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/memchr-2.4.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' --cfg 'feature="use_std"' -C metadata=765308f9d4690e77 -C extra-filename=-765308f9d4690e77 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg memchr_runtime_simd --cfg memchr_runtime_sse2 --cfg memchr_runtime_sse42 --cfg memchr_runtime_avx`
|     Building [===>                      ] 34/204: thread_local, serde_json(...
|     Building [===>                      ] 35/204: thread_local, serde_json(...
|     Building [===>                      ] 36/204: thread_local, serde_json(...
|     Building [===>                      ] 37/204: thread_local, serde_json(...
|    Compiling unicode-normalization v0.1.13
|     Building [===>                      ] 38/204: thread_local, serde_json(...
|      Running `rustc --crate-name unicode_normalization --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/unicode-normalization-0.1.13/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=7d87c283b3d71445 -C extra-filename=-7d87c283b3d71445 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokyb
 uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern tinyvec=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libtinyvec-f8669d851db5ed2e.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [====>                     ] 40/204: thread_local, serde_json(...
|     Building [====>                     ] 41/204: thread_local, serde_json(...
|     Building [====>                     ] 43/204: thread_local, glob, serde...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/serde_json-ea1b7eb6eff580e2/build-script-build`
|     Building [====>                     ] 44/204: thread_local, glob, serde...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/crc32fast-f09f15bbd97263a0/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/crc32fast-f09f15bbd97263a0/build-script-build`
|     Building [====>                     ] 47/204: thread_local, glob, serde...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/bitflags-5769edfbfae4589d/build-script-build`
|     Building [=====>                    ] 48/204: thread_local, glob, autoc...
|     Building [=====>                    ] 49/204: thread_local, glob, autoc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/serde_derive-7fa9324567ec7678/build-script-build`
|     Building [=====>                    ] 50/204: thread_local, glob, autoc...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=95a77b3b0e94cde8 -C extra-filename=-95a77b3b0e94cde8 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/r
 elease/deps/libcfg_if-1df878b643579860.rmeta --cap-lints allow --cfg crc32fast_stdarchx86`
|     Building [=====>                    ] 51/204: thread_local, glob, autoc...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/serde-44197ea7c70eb389/build-script-build`
|     Building [=====>                    ] 53/204: thread_local, glob, autoc...
|      Running `rustc --crate-name bitflags /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/bitflags-1.2.1/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' -C metadata=137d0868f3ae08ac -C extra-filename=-137d0868f3ae08ac --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l
 inux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg bitflags_const_fn`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/ryu-1cb68d672ad7a65b/build-script-build`
|     Building [======>                   ] 55/204: thread_local, glob, crc32...
|      Running `rustc --crate-name crc32fast /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/crc32fast-1.2.0/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=fd3cc24b5620f6f7 -C extra-filename=-fd3cc24b5620f6f7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libcfg_if-e5069094d9b82b92.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg crc32fast_stdarchx86`
|     Building [======>                   ] 56/204: thread_local, glob, crc32...
|     Building [======>                   ] 57/204: thread_local, glob, crc32...
|     Building [======>                   ] 58/204: syn(build), thread_local,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/syn-ff848330357a271f/build-script-build`
|     Building [======>                   ] 59/204: syn(build), thread_local,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/syn-ff848330357a271f/build-script-build`
|     Building [======>                   ] 60/204: syn(build), thread_local,...
|      Running `rustc --crate-name ryu --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/ryu-1.0.5/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=c2e8d19873c485a4 -C extra-filename=-c2e8d19873c485a4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/
 build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg integer128 --cfg maybe_uninit`
|     Building [======>                   ] 61/204: syn(build), thread_local,...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/anyhow-39e7c6d343c842aa/build-script-build`
|     Building [======>                   ] 62/204: thread_local, glob, crc32...
|     Building [=======>                  ] 63/204: thread_local, glob, crc32...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/semver-f2f3c8dcc8d14481/build-script-build`
|     Building [=======>                  ] 64/204: thread_local, glob, crc32...
|     Building [=======>                  ] 65/204: thread_local, glob, crc32...
|     Building [=======>                  ] 66/204: thread_local, glob, crc32...
|     Building [=======>                  ] 67/204: thread_local, glob, crc32...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/libc-cdd8189d413eab78/build-script-build`
|     Building [=======>                  ] 68/204: thread_local, glob, crc32...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/libc-cdd8189d413eab78/build-script-build`
|    Compiling indexmap v1.9.1
|     Building [=======>                  ] 69/204: thread_local, glob, crc32...
|      Running `rustc --crate-name build_script_build --edition=2021 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/indexmap/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="std"' -C metadata=e7268755bdc99e87 -C extra-filename=-e7268755bdc99e87 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/indexmap-e7268755bdc99e87 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern autocfg=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/
 target/release/deps/libautocfg-168ce7056595053a.rlib --cap-lints allow`
|     Building [=======>                  ] 70/204: thread_local, glob, crc32...
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/libc/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=cd87b2bf575e77f4 -C extra-filename=-cd87b2bf575e77f4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align -
 -cfg libc_int128 --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of --cfg libc_underscore_const_names`
|     Building [========>                 ] 71/204: thread_local, glob, crc32...
|      Running `rustc --crate-name libc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/libc/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="align"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=29ef2314884b6717 -C extra-filename=-29ef2314884b6717 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg freebsd11 --cfg libc_priv_mod_use --cfg libc_union --cfg libc_const_size_of --cfg libc_align --cfg libc_int128 --cfg libc_core_cvoid --cfg libc_packedN --cfg libc_cfg_target_vendor --cfg libc_non_exhaustive --cfg libc_ptr_addr_of --cfg libc_underscore_const_names`
|     Building [========>                 ] 72/204: thread_local, glob, crc32...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro2-3d7015700e24e8ca/build-script-build`
|     Building [========>                 ] 73/204: thread_local, glob, crc32...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro2-3d7015700e24e8ca/build-script-build`
|    Compiling proc-macro-error-attr v1.0.4
|     Building [========>                 ] 74/204: thread_local, glob, crc32...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro-error-attr/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=f6e63d8d96db356f -C extra-filename=-f6e63d8d96db356f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro-error-attr-f6e63d8d96db356f -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0
 -r0/build/target/release/deps/libversion_check-bc3b18b8fd009818.rlib --cap-lints allow`
|    Compiling proc-macro-error v1.0.4
|     Building [========>                 ] 75/204: thread_local, glob, crc32...
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro-error/build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="syn"' --cfg 'feature="syn-error"' -C metadata=bdb0660d32d4c1e4 -C extra-filename=-bdb0660d32d4c1e4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro-error-bdb0660d32d4c1e4 -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps/libversion_check-bc3b18b8fd009818.rlib --cap-lints allow`
|    Compiling im-rc v15.0.0
|      Running `rustc --crate-name build_script_build --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/im-rc/./build.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C metadata=75c7f767454fb7ee -C extra-filename=-75c7f767454fb7ee --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/im-rc-75c7f767454fb7ee -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern version_check=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps/
 libversion_check-bc3b18b8fd009818.rlib --cap-lints allow`
|     Building [========>                 ] 76/204: thread_local, glob, crc32...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro2-1.0.37/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debug-assertions=off --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=9dc08df8d8a3526f -C extra-filename=-9dc08df8d8a3526f --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/build-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/cargo/1.63.0-r0/build/target/release/deps/libunicode_xid-2f740e06e11340aa.rmeta --cap-lints allow --cfg use_proc_macro --cfg wrap_proc_macro`
|     Building [========>                 ] 76/204: thread_local, proc-macro2...
|      Running `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro2-1.0.37/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=8253606461f4c91d -C extra-filename=-8253606461f4c91d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libunicode_xid-2c90d83903ccd157.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg use_proc_macro --cfg wrap_proc_macro`
|      Running `rustc --crate-name anyhow --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/anyhow-1.0.51/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=b2fdfbd594bc7023 -C extra-filename=-b2fdfbd594bc7023 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg backtrace`
|     Building [========>                 ] 77/204: thread_local, proc-macro2...
|     Building [========>                 ] 78/204: thread_local, proc-macro2...
| error[E0463]: can't find crate for `proc_macro`
|    --> /usr/src/debug/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro2-1.0.37/src/lib.rs:119:1
|     |
| 119 | extern crate proc_macro;
|     | ^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
| 
|     Building [=========>                ] 79/204: thread_local, proc-macro2...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/byteorder-41f58097cc7dadda/build-script-build`
|     Building [=========>                ] 80/204: proc-macro2, glob, crc32f...
|     Building [=========>                ] 81/204: proc-macro2, glob, crc32f...
|     Building [=========>                ] 82/204: proc-macro2, glob, crc32f...
|     Building [=========>                ] 83/204: proc-macro2, glob, crc32f...
|      Running `rustc --crate-name byteorder /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/byteorder/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=d5633843c75098a9 -C extra-filename=-d5633843c75098a9 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg byteorder_i128`
|     Building [=========>                ] 84/204: proc-macro2, glob, crc32f...
|     Building [=========>                ] 85/204: proc-macro2, glob, hex, p...
|    Compiling aho-corasick v0.7.18
|    Compiling bstr v0.2.13
|      Running `rustc --crate-name aho_corasick --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/aho-corasick/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=dbcf7b3beacc443a -C extra-filename=-dbcf7b3beacc443a --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-765308f9d4690e77.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [=========>                ] 86/204: proc-macro2, glob, hex, b...
|      Running `rustc --crate-name bstr /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/bstr/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="lazy_static"' --cfg 'feature="regex-automata"' --cfg 'feature="std"' --cfg 'feature="unicode"' -C metadata=239d50fe340a856c -C extra-filename=-239d50fe340a856c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/relea
 se/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern lazy_static=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/liblazy_static-d8e008d7ee6c064a.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-765308f9d4690e77.rmeta --extern regex_automata=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libregex_automata-ec56312d243b0aa9.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|    Compiling combine v4.6.3
|      Running `rustc --crate-name combine --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/combine/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="bytes"' --cfg 'feature="default"' --cfg 'feature="std"' -C metadata=333ac448481c6cf7 -C extra-filename=-333ac448481c6cf7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependenc
 y=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern bytes=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libbytes-dd4df98ba647020f.rmeta --extern memchr=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libmemchr-765308f9d4690e77.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [==========>               ] 87/204: proc-macro2, glob, indexm...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/indexmap-e7268755bdc99e87/build-script-build`
|     Building [==========>               ] 88/204: proc-macro2, glob, hex, b...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/typenum-85294f0eccf3782e/build-script-main`
|     Building [==========>               ] 89/204: proc-macro2, glob, hex, b...
|     Building [==========>               ] 90/204: proc-macro2, glob, hex, b...
|     Building [==========>               ] 91/204: proc-macro2, glob, hex, b...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro-error-attr-f6e63d8d96db356f/build-script-build`
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/proc-macro-error-bdb0660d32d4c1e4/build-script-build`
|     Building [==========>               ] 92/204: proc-macro2, glob, hex, b...
|     Building [==========>               ] 93/204: proc-macro2, glob, hex, b...
|     Building [==========>               ] 94/204: proc-macro2, glob, hex, b...
|     Building [===========>              ] 95/204: proc-macro2, glob, hex, b...
|      Running `rustc --crate-name typenum /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/typenum/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C metadata=4cdcd8256bc9cfc4 -C extra-filename=-4cdcd8256bc9cfc4 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/
 release/deps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0`
|     Building [===========>              ] 96/204: proc-macro2, glob, hex, b...
|      Running `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/build/im-rc-75c7f767454fb7ee/build-script-build`
|     Building [===========>              ] 97/204: proc-macro2, glob, hex, b...
|     Building [===========>              ] 98/204: proc-macro2, glob, hex, b...
|     Building [===========>              ] 99/204: proc-macro2, glob, hex, b...
| For more information about this error, try `rustc --explain E0463`.
| error: could not compile `proc-macro2` due to previous error
| 
| Caused by:
|   process didn't exit successfully: `rustc --crate-name proc_macro2 --edition=2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/vendor/proc-macro2-1.0.37/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="proc-macro"' -C metadata=8253606461f4c91d -C extra-filename=-8253606461f4c91d --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps --target i686-poky-linux-gnu -C linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/wrapper/target-rust-ccld -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps -L dependency=/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/release/deps --extern unicode_xid=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/build/target/i686-poky-linux-gnu/release/deps/libunicode_xid-2c90d83903ccd157.rmeta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/recipe-sysroot/usr/lib/rustlib/i686-poky-linux-gnu/lib --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0=/usr/src/debug/cargo/1.63.0-r0 --cfg use_proc_macro --cfg wrap_proc_macro` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [===========>             ] 100/204: glob, hex, bstr, libc, te...
|     Building [===========>             ] 101/204: glob, hex, bstr, libc, st...
|     Building [===========>             ] 102/204: glob, bstr, libc, strsim,...
|     Building [===========>             ] 103/204: glob, bstr, libc, strsim,...
|     Building [===========>             ] 104/204: glob, bstr, libc, strsim,...
|     Building [===========>             ] 105/204: glob, bstr, libc, strsim,...
|     Building [===========>             ] 106/204: glob, bstr, libc, walkdir...
|     Building [============>            ] 107/204: glob, bstr, libc, anyhow,...
|     Building [============>            ] 108/204: glob, bstr, libc, anyhow,...
|     Building [============>            ] 109/204: glob, bstr, libc, anyhow,...
|     Building [============>            ] 110/204: glob, bstr, libc, libc, t...
|     Building [============>            ] 111/204: glob, bstr, libc, libc, t...
|     Building [============>            ] 112/204: bstr, libc, libc, typenum...
|     Building [============>            ] 113/204: bstr, libc, libc, typenum...
|     Building [============>            ] 114/204: bstr, libc, typenum, unic...
|     Building [=============>           ] 115/204: bstr, typenum, unicode-no...
|     Building [=============>           ] 116/204: bstr, typenum, combine, i...
|     Building [=============>           ] 117/204: bstr, combine, itertools,...
|     Building [=============>           ] 118/204: combine, itertools, aho-c...
|     Building [=============>           ] 119/204: combine, itertools, regex...
|     Building [=============>           ] 120/204: combine, regex-syntax
|     Building [=============>           ] 121/204: combine
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/run.do_compile.2964067:171 exit 101 from '"cargo" build -v --target i686-poky-linux-gnu --release --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/rustc-1.63.0-src/src/tools/cargo//Cargo.toml "$@"'
| WARNING: Backtrace (BB generated script):
| 	#1: oe_cargo_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/run.do_compile.2964067, line 171
| 	#2: cargo_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/run.do_compile.2964067, line 161
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/run.do_compile.2964067, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/run.do_compile.2964067, line 203
NOTE: recipe cargo-1.63.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 843 tasks of which 716 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cargo-1.63.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/run.do_compile.2964067', 101, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cargo/1.63.0-r0/temp/log.do_compile.2964067
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.63.0.bb:do_compile) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7376122652102210221==--

