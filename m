Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22720CD37B2
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11410.1725172853544816731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VW6oVTVX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uWv0mY0h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a83f-6a9dac50-b1e1-4a0a-99f7-dc8e6fe528c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a0EV6K1gsjGYVMrJWMwAJuDHr5QvOwe/Rp8FeDl+vgs=;
	b=VW6oVTVXF6ZfyVuOcWHLLcD8T5QKf/uVUVm9uuMkw+zMQ4tkaol4S3tRcG63vapd
	91HF2jjSWM+bNw0HQLp/DNpKJFp+SbXfo8cowdje16/e6l5u2WTQFiRz3AYwwe2Wv7A
	0xNzgTPuTzORwO1Nh9b8dmOaAluWxSK4L7FoTU5M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a0EV6K1gsjGYVMrJWMwAJuDHr5QvOwe/Rp8FeDl+vgs=;
	b=uWv0mY0h3ixDRpIx51bJngOnTPQg0vTLQV149RhC53NT/tow1yXZDBdP+06Ry2EX
	eS1ZgVX7/tUAPDWaGVdeWGUKKQBNe2bRXDwHehh60G2F8wL/tYQKUsqiKU6ZaUK5fSe
	+cWF/HTix7MWrFri57eBtjLGygo5KMnOAC7ZNCyE=
Content-Type: multipart/mixed; boundary="===============9150365054593155424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2024.8.30 FAILED
Message-ID: <01010191ac50a83f-6a9dac50-b1e1-4a0a-99f7-dc8e6fe528c7-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203994

--===============9150365054593155424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2024.8.30* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-certifi' failed
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
Sstate summary: Wanted 344 Local 333 Mirrors 0 Missed 11 Current 291 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 312 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 315 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 316 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 635 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_create_spdx_setscene)
NOTE: Running task 861 of 1806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 893 of 1806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2024.7.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-native-72.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-setuptools-native-72.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 635 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.44.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-certifi-2024.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.12.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 635 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 467 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-certifi-2024.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 479 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-native-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-native-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2024.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 482 of 635 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running task 1017 of 1806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-certifi-2024.7.4-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 1806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-certifi-2024.7.4-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2024.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 1806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe python3-certifi-2024.7.4-r0: task do_patch: Failed
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 1245 tasks of which 1240 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061605.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061605.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2618467
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-certifi/2024.7.4/temp/log.do_patch.2619030
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2618468
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-certifi-2024.7.4-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2618467
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-certifi/2024.7.4/temp/log.do_patch.2619030
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2618468
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9150365054593155424==--

