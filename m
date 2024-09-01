Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B506CD37BA
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11345.1725172853211862603
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=W0V7IQXm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VXo4fLY4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191ac50a613-588870e2-2b74-4fe5-83fc-e327119207c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3g5S5F81cEgBcyutSIlLSxM5iRtk/NtOILPmyts8zLk=;
	b=W0V7IQXmWvg3RHjyTDkAomQulU2/hyNvv0HROw8aOpdOMhTzGdLjgQ9JrRJv12ur
	Pninwtem40PqQESQPJ1Qc1g+gVuJWkhYfKPXNOD8Wfz4HJeJnVdCVwpL884tWYTqRg8
	mS6V4Q881+2becb1YONwOzkgYGnyzALBRnEB2mc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3g5S5F81cEgBcyutSIlLSxM5iRtk/NtOILPmyts8zLk=;
	b=VXo4fLY49E1OQTzDwHcXnVeKe4JQ1Dv6tjHV3B42qxJOl29Ri/bomflMKNvIHKEj
	0E4AlWUBRxLDk2YeTp2b36Gbb1a5x020mkqYpWtkrrqee+CEYJ7GXIz4K4jTgSKczVQ
	/Uvqr8krPsPQJkSc1TXIq2k4evXRJlWiKpIGb77U=
Content-Type: multipart/mixed; boundary="===============8545672869728695052=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-llvm,rust,libstd-rs,cargo: upgrading to
 1.80.1,1.80.1,1.80.1,1.80.1 FAILED
Message-ID: <01010191ac50a613-588870e2-2b74-4fe5-83fc-e327119207c6-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203986

--===============8545672869728695052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-llvm,rust,libstd-rs,cargo* to *1.80.1,1.80.1,1.80.1,1.80.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake rust-llvm rust libstd-rs cargo' failed
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
DISTRO_VERSION       = "5.0+snapshot-ae0abf6bc5a042b7a57fd7144e3af09a957ed950"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ae0abf6bc5a042b7a57fd7144e3af09a957ed950"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 375 Local 336 Mirrors 0 Missed 39 Current 222 (89% match, 93% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 237 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 261 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 263 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 266 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 273 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 278 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 289 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 290 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 296 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_create_spdx_setscene)
NOTE: Running setscene task 298 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_qa_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-1.79.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe rust-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 303 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: Running setscene task 304 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_create_spdx_setscene)
NOTE: recipe rust-llvm-1.79.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 308 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_create_spdx_setscene)
NOTE: recipe cargo-1.79.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 320 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rust-1.79.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_create_spdx_setscene)
NOTE: recipe cargo-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnu-config-native-20240823+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnu-config-native-20240823+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 413 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_recipe_qa_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 415 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cargo-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 719 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_fetch)
NOTE: recipe cargo-native-1.79.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libssh2-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cargo-native-1.79.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-1.79.0-r0: task do_fetch: Started
NOTE: Running setscene task 421 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 422 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_create_spdx_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 427 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe rust-native-1.79.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssh2-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 734 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_fetch)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.79.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_create_spdx_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_fetch: Started
NOTE: recipe rust-llvm-native-1.79.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-native-3.12.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-llvm-native-1.79.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_package_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_package_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_setscene: Started
NOTE: recipe python3-native-3.12.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.30.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_package_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_package_setscene: Started
NOTE: recipe cmake-native-3.30.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-native-3.30.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rust-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rust-llvm-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rust-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 439 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe rust-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_setscene: Succeeded
NOTE: recipe rust-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 797 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_fetch)
NOTE: recipe rust-1.79.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cargo-native-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe rust-llvm-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 444 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe rust-llvm-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 447 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-llvm-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 802 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_fetch)
NOTE: recipe ca-certificates-native-20240203-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_fetch: Started
NOTE: recipe libssh2-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 803 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_unpack)
NOTE: recipe cargo-native-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssh2-native-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-native-20240203-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_recipe_qa_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_unpack: Started
NOTE: recipe binutils-2.43.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 454 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: recipe libssh2-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-native-20240203-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20240203-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssh2-native-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 457 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_package_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 836 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_fetch)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-llvm-native-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Started
NOTE: recipe rust-native-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Succeeded
NOTE: Running task 844 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_unpack)
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 462 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 463 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 468 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 472 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 478 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 486 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 868 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 494 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 516 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 533 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 540 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 541 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package_setscene)
NOTE: Running setscene task 543 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 545 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 905 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 551 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 908 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 561 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 569 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 931 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 954 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-llvm-1.79.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patch-native-2.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-native-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1263 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_patch)
NOTE: Running task 1295 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch)
NOTE: Running task 1434 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssh2-1.11.0-r0: task do_patch: Started
NOTE: Running task 1466 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe libssh2-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1485 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.43.1-r0: task do_patch: Started
NOTE: recipe rust-llvm-native-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe rust-llvm-native-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-llvm-native-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1532 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1543 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_ipk)
NOTE: Running task 1544 of 1641 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_deb)
NOTE: recipe rust-llvm-1.79.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_write_deb: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_write_ipk: Started
NOTE: recipe rust-llvm-1.79.0-r0: task do_unpack: Failed
NOTE: recipe rust-1.79.0-r0: task do_fetch: Succeeded
NOTE: recipe cargo-1.79.0-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.11.0-r0: task do_patch: Failed
NOTE: recipe binutils-2.43.1-r0: task do_patch: Failed
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_write_ipk: Failed
NOTE: recipe rust-llvm-1.79.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libssh2-1.11.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe binutils-2.43.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libstd-rs-1.79.0-r0: task do_package_write_deb: Failed
NOTE: recipe libssh2-1.11.0-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 1547 tasks of which 1524 didn't need to be rerun and 10 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901054855.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901054855.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 10 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_unpack.2548326
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_patch.2548487
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_patch.2548494
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.11.0/temp/log.do_collect_spdx_deps.2548507
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libstd-rs/1.79.0/temp/log.do_package_write_ipk.2548533
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_prepare_recipe_sysroot.2548531
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_prepare_recipe_sysroot.2548488
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_prepare_recipe_sysroot.2548495
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libstd-rs/1.79.0/temp/log.do_package_write_deb.2548536
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_collect_spdx_deps.2548499
Summary: There were 10 ERROR messages, returning a non-zero exit code.

ERROR: rust-llvm-1.79.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libssh2-1.11.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: binutils-2.43.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libgcrypt-1.11.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libstd-rs-1.79.0-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_unpack.2548326
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_unpack) failed with exit code '1'
ERROR: rust-llvm-1.79.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_patch.2548487
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_patch) failed with exit code '1'
ERROR: libssh2-1.11.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_patch.2548494
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch) failed with exit code '1'
ERROR: binutils-2.43.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.11.0/temp/log.do_collect_spdx_deps.2548507
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libstd-rs/1.79.0/temp/log.do_package_write_ipk.2548533
ERROR: libstd-rs-1.79.0-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/rust-llvm/1.79.0/temp/log.do_prepare_recipe_sysroot.2548531
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_prepare_recipe_sysroot.2548488
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: libssh2-1.11.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_prepare_recipe_sysroot.2548495
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libstd-rs/1.79.0/temp/log.do_package_write_deb.2548536
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libssh2/1.11.0/temp/log.do_collect_spdx_deps.2548499
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libssh2/libssh2_1.11.0.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8545672869728695052==--

