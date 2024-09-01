Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677C0CD3441
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11360.1725172853932677856
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J80vpmae;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Qe/NF1/h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191ac50a8da-85173b83-c5a2-46a4-bb0a-ef68276fdead-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t4t1bFIXZwZpOKvEzeF93E9fQEcBkZiRIo3Gz4pSRk8=;
	b=J80vpmaeAPAFHm1Qgg82I9otrzP9eAawmOClS6ahVEcHdVeGxlysQxwSyJovOBx4
	Gl9mfIoAtUuXcHUo060mlauLHBc/sqOIjqJ/fRXKl42B/6/8F9AQzqaoRrGP1VKVjUG
	MMGukOlWpnVmJ1d4dSnd/0U4BITDCgduH7b5Kea0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t4t1bFIXZwZpOKvEzeF93E9fQEcBkZiRIo3Gz4pSRk8=;
	b=Qe/NF1/h4vE++rmSBvuV7lQpsEpZQRCCPrUYIoiHwGG6K51I/R4gY/cbcj2MyRFW
	HgOrB/tRyDHBytIhVdrlu7SjbAuiPtBQqfP/LNC+OpvmF9qBSwH8wI+TlZmKgVt2GWr
	+c7ZE7U7PFWl70Ydq0/tKZk2A9ZOK86fMEOGX+p0=
Content-Type: multipart/mixed; boundary="===============5264235075392205499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.7.1 FAILED
Message-ID: <01010191ac50a8da-85173b83-c5a2-46a4-bb0a-ef68276fdead-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204014

--===============5264235075392205499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.7.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-maturin' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-69fe8a0f5dace7480b8e2d398b3560c8d7759a73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69fe8a0f5dace7480b8e2d398b3560c8d7759a73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 353 Local 315 Mirrors 0 Missed 38 Current 387 (89% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 454 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.7.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 455 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 740 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pip-24.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-maturin-1.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-maturin-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 700 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 705 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe cargo-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-maturin-1.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 707 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1375 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1423 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pip-24.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-maturin-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pip-24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_recipe_qa_setscene)
NOTE: recipe rust-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1872 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_fetch)
NOTE: recipe python3-maturin-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 729 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pip-24.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 730 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 731 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe rust-llvm-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-1.79.0-r0: task do_fetch: Started
NOTE: Running task 1879 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_fetch: Succeeded
NOTE: Running task 1880 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_unpack)
NOTE: recipe rust-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 735 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 736 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1882 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_fetch)
NOTE: recipe cargo-1.79.0-r0: task do_unpack: Started
NOTE: recipe python3-maturin-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1884 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-maturin_1.7.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_fetch: Started
NOTE: recipe libssh2-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1890 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_unpack)
NOTE: Running task 1891 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1893 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_fetch)
NOTE: recipe python3-pip-24.2-r0: task do_fetch: Succeeded
NOTE: Running task 1894 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_unpack)
NOTE: Running task 1895 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1897 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_fetch)
NOTE: recipe python3-maturin-1.7.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_unpack: Started
NOTE: recipe libssh2-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-24.2-r0: task do_unpack: Started
NOTE: recipe rust-1.79.0-r0: task do_fetch: Started
NOTE: recipe python3-pip-24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_fetch: Started
NOTE: recipe rust-1.79.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1919 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_patch)
NOTE: Running task 1937 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_unpack)
NOTE: recipe python3-pip-24.2-r0: task do_unpack: Succeeded
NOTE: Running task 1966 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_collect_spdx_deps)
NOTE: Running task 1967 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_patch)
NOTE: Running task 1970 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_unpack)
NOTE: Running task 1972 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.11.0-r0: task do_patch: Started
NOTE: recipe rust-1.79.0-r0: task do_unpack: Started
NOTE: recipe python3-pip-24.2-r0: task do_patch: Started
NOTE: recipe libssh2-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-24.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1973 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_patch)
NOTE: Running task 1974 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_collect_spdx_deps)
NOTE: recipe rust-llvm-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_patch: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 740 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1976 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_fetch)
NOTE: recipe rust-llvm-1.79.0-r0: task do_fetch: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_fetch: Succeeded
NOTE: Running task 1977 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_unpack)
NOTE: Running task 1978 of 2092 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-llvm-1.79.0-r0: task do_unpack: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe cargo-1.79.0-r0: task do_unpack: Failed
NOTE: recipe libssh2-1.11.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-pip-24.2-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe rust-1.79.0-r0: task do_unpack: Failed
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe rust-llvm-1.79.0-r0: task do_unpack: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libssh2-1.11.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-pip-24.2-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_patch: Failed
NOTE: recipe rust-llvm-1.79.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libssh2-1.11.0-r0: task do_patch: Failed
NOTE: recipe python3-pip-24.2-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-rust-1.10.1-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-maturin-1.7.0-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1978 tasks of which 1953 didn't need to be rerun and 15 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061808.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061808.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 15 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2627446
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cargo/1.79.0/temp/log.do_unpack.2627810
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_prepare_recipe_sysroot.2627929
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_prepare_recipe_sysroot.2627950
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust/1.79.0/temp/log.do_unpack.2627997
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools-rust/1.10.1/temp/log.do_prepare_recipe_sysroot.2628018
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_unpack.2628096
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2627450
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_collect_spdx_deps.2628013
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_collect_spdx_deps.2628016
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools-rust/1.10.1/temp/log.do_patch.2628046
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_prepare_recipe_sysroot.2628097
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_patch.2627994
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_patch.2628014
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools-rust/1.10.1/temp/log.do_collect_spdx_deps.2628047
Summary: There were 15 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: cargo-1.79.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libssh2-1.11.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pip-24.2-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: rust-1.79.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-setuptools-rust-1.10.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: rust-llvm-1.79.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2627446
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cargo/1.79.0/temp/log.do_unpack.2627810
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_prepare_recipe_sysroot.2627929
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: libssh2-1.11.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_prepare_recipe_sysroot.2627950
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-pip-24.2-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust/1.79.0/temp/log.do_unpack.2627997
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools-rust/1.10.1/temp/log.do_prepare_recipe_sysroot.2628018
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-setuptools-rust-1.10.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_unpack.2628096
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_unpack) failed with exit code '1'
ERROR: rust-llvm-1.79.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2627450
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_collect_spdx_deps.2628013
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: libssh2-1.11.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_collect_spdx_deps.2628016
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: python3-pip-24.2-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools-rust/1.10.1/temp/log.do_patch.2628046
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_patch) failed with exit code '1'
ERROR: python3-setuptools-rust-1.10.1-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_prepare_recipe_sysroot.2628097
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_patch.2627994
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_patch.2628014
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools-rust/1.10.1/temp/log.do_collect_spdx_deps.2628047
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5264235075392205499==--

