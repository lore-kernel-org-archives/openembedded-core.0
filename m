Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5366DCD37B8
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11411.1725172853605064555
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VJyH0BCD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=krYsiLRz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191ac50aaeb-cca17d42-9bff-40f5-b4e1-1222eb198a84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z7ggDq0+FdGDcyQ2Vfd48S1RPbaaMpNm1Ra5VoxL8a4=;
	b=VJyH0BCDqhRYk7wkwIUwmUMdVIXXEEoPFyWnIuMFwATylBGm4B1KQXsi949akAUz
	ncvAnJUR86yNrHd3uoTwEJ1TsekfoFAJjuFmdLmVio30VKMLZaJEN0Ki0ZFoCTg9QpX
	N0oWdQBpIjEWo5yRaME0qQ1Y7p80s9tlzAkRxfaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z7ggDq0+FdGDcyQ2Vfd48S1RPbaaMpNm1Ra5VoxL8a4=;
	b=krYsiLRz5AJn7y+DXTYFqaeotsU0RyFqotsUtyvAnaAdK6PMpCd6sNwXF+WYydsw
	H6vD9OxrA0Wz13AqNFrfiHgzTHP72R44UccWY/S22yOnKKKC+NQK2Qt3AO3jqx/gJhU
	rPYZxv3J6oFbFlTnsg/HViIX32kunAw/ad2053kE=
Content-Type: multipart/mixed; boundary="===============8249459398727329281=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland: upgrading to 1.23.1 FAILED
Message-ID: <01010191ac50aaeb-cca17d42-9bff-40f5-b4e1-1222eb198a84-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204013

--===============8249459398727329281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland* to *1.23.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake wayland' failed
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
Sstate summary: Wanted 289 Local 272 Mirrors 0 Missed 17 Current 401 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 477 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 486 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_package_setscene)
NOTE: Running setscene task 489 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_package_setscene)
NOTE: Running setscene task 490 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 495 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 496 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 507 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 510 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: Running setscene task 511 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package_setscene)
NOTE: Running setscene task 512 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: Running setscene task 521 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_package_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: Running setscene task 622 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_package_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1315 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1344 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 652 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 653 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 654 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 655 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 657 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1520 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_fetch)
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 663 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 665 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1610 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1713 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: Running task 1728 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1730 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1741 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running setscene task 681 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1743 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 690 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1805 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1876 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.43.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 1923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe binutils-2.43.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe binutils-2.43.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe binutils-2.43.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1877 tasks of which 1864 didn't need to be rerun and 5 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063351.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063351.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 5 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2672708
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.11.0/temp/log.do_collect_spdx_deps.2674558
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_prepare_recipe_sysroot.2674557
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2672710
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_patch.2674612
Summary: There were 5 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libgcrypt-1.11.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: binutils-2.43.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2672708
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.11.0/temp/log.do_collect_spdx_deps.2674558
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_prepare_recipe_sysroot.2674557
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: binutils-2.43.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2672710
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/binutils/2.43.1/temp/log.do_patch.2674612
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8249459398727329281==--

