Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2218CA9EDD
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7624.1685693431682253217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TxPdqntY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b287c05-3131a785-b8e1-416c-9850-884af83e397e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ZS/NUXsEHTreNgJYRk6PugKf0fQUTcbB2ZQhnqAdsP8=;
	b=TxPdqntYURwyWKYnx8w7FL4gbWtbSZvM3OFI422WfcQIAM6nUOky0NDqh5KlssI/
	IfHSIKKSMiPkRlvDXC657OANWAqnJ9QyhzH4O9Cqw4nCswG/q6as1KNouIgnQdMehwe
	GxvSYLD6Op4Jmy806jI4I5HOyVvR/CLbVRWSUhEw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ZS/NUXsEHTreNgJYRk6PugKf0fQUTcbB2ZQhnqAdsP8=;
	b=kftna6nEJ3IdhrBT5JaMVC1K0EiHLzknNM6TpIgSavbyB6LNiyTFiWbUktOlSvu2
	VyZ5A4dcU/nO9fxiahFr+XZnHwO+WILY/HxR0/r0MsubBAZlbeiD+smVfSModC/LS1e
	54l5ghFypsgMzL7Yyc4xMqjvMQFUiyT983wk1iOM=
Content-Type: multipart/mixed; boundary="===============3906799498936442431=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 2.6.1 SUCCEEDED
Message-ID: <010101887b287c05-3131a785-b8e1-416c-9850-884af83e397e-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182167

--===============3906799498936442431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apt* to *2.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apt-upgrade-2.6.0-2.6.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3906799498936442431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6b3ad86b1b131df84ae45b11886e82020170b6d1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 28 Mirrors 0 Missed 57 Current 393 (32% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 394 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcrypt/4.4.33-r0/temp/log.do_packagedata_setscene.464213
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 465 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 895 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 896 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 973 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 994 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 995 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 996 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 997 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 998 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1104 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: Running task 1105 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_fetch)
NOTE: Running task 1124 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_fetch)
NOTE: Running task 1129 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_fetch)
NOTE: Running task 1191 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1330 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1331 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1333 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1334 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1335 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Started
NOTE: Running task 1350 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1351 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1352 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Started
NOTE: Running task 1353 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_fetch: Started
NOTE: Running task 1389 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1406 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_unpack)
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: Running task 1407 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1427 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Started
NOTE: recipe apt-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1428 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 1429 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_unpack)
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: Running task 1470 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Started
NOTE: Running task 1471 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_unpack: Started
NOTE: Running task 1472 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1473 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: Running task 1474 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1475 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_patch)
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Started
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1477 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Started
NOTE: Running task 1478 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1480 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_patch: Started
NOTE: Running task 1551 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1580 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Started
NOTE: Running task 1581 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1584 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1585 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: Running task 1586 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_configure: Started
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 1588 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1589 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1616 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: Running task 1617 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1619 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe apt-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: Running task 1620 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1621 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_generate_toolchain_file)
NOTE: Running task 1622 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic)
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Succeeded
NOTE: Running task 1623 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_configure)
NOTE: Running task 1624 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: Running task 1625 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Started
NOTE: Running task 1626 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1627 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Started
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: Running task 1628 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic unihash changed to 0ed913aa5d606ac8ef0d012933bd07203a8ed8679aaf5c3ef23112ed2c3cc038
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1630 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: Running task 1631 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1632 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Succeeded
NOTE: Running task 1633 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_configure: Started
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1634 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_install)
NOTE: recipe xxhash-0.8.1-r0: task do_install: Started
NOTE: recipe xxhash-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_package)
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_package: Started
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1637 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1638 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to bd901e4be06c314406c0ba4e712092a8843b38a91e3c90857c8e1afa2058dc07
NOTE: recipe xxhash-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_packagedata)
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Started
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1640 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_compile)
NOTE: recipe libmd-1.0.4-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_install)
NOTE: recipe libmd-1.0.4-r0: task do_install: Started
NOTE: recipe libmd-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_package)
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_populate_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_package: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_packagedata)
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Started
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1650 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1651 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1652 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1653 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1654 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1655 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe db-1_5.3.28-r1: task do_configure: Succeeded
NOTE: Running task 1656 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 1657 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1658 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: Running task 1659 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1661 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1662 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1663 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1666 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_compile: Succeeded
NOTE: Running task 1668 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_install)
NOTE: recipe db-1_5.3.28-r1: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1669 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_install: Succeeded
NOTE: Running task 1672 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot)
NOTE: Running task 1673 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Succeeded
NOTE: Running task 1674 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_compile)
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1677 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Succeeded
NOTE: Running task 1678 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe dpkg-1.21.21-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1680 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 1683 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package)
NOTE: recipe dpkg-1.21.21-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1686 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1687 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe dpkg-1.21.21-r0: task do_package: Succeeded
NOTE: Running task 1688 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_packagedata)
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1689 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1690 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1691 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Started
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1706 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1707 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1708 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1709 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1711 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1713 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_configure)
NOTE: recipe apt-2.6.1-r0: task do_configure: Started
NOTE: recipe apt-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_compile: Started
NOTE: recipe apt-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1716 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_install: Started
NOTE: Running task 1717 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1718 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package)
NOTE: Running task 1719 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_package: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_packagedata)
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Started
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1721 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_write_rpm)
NOTE: Running task 1722 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_qa)
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1723 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1723 tasks of which 1557 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3906799498936442431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6b3ad86b1b131df84ae45b11886e82020170b6d1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 84 Local 27 Mirrors 0 Missed 57 Current 394 (32% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 395 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxcrypt/4.4.33-r0/temp/log.do_packagedata_setscene.692567
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 477 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 895 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 896 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 973 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 994 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 995 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 996 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 997 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 998 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1104 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: Running task 1105 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_fetch)
NOTE: Running task 1124 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_fetch)
NOTE: Running task 1129 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_fetch)
NOTE: Running task 1191 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1365 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1367 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1378 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Started
NOTE: Running task 1379 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: Running task 1393 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1394 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1395 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Started
NOTE: Running task 1407 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_fetch: Started
NOTE: Running task 1421 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: Running task 1461 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_unpack)
NOTE: Running task 1462 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1463 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: Running task 1464 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Started
NOTE: Running task 1466 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: Running task 1467 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: Running task 1468 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Started
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1469 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_unpack)
NOTE: Running task 1470 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_unpack)
NOTE: Running task 1471 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: Running task 1473 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_unpack)
NOTE: Running task 1474 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1475 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 1476 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_patch)
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 1478 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Started
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe libmd-1.0.4-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe apt-2.6.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1480 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1481 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Succeeded
NOTE: Running task 1482 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 1529 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata)
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1579 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 1580 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1582 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Started
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Started
NOTE: Running task 1583 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1584 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe apt-2.6.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_configure: Started
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1587 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1588 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1589 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1590 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: Running task 1617 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: Running task 1619 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1620 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_configure)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: Running task 1621 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1622 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1623 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1624 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe apt-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1625 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1626 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_generate_toolchain_file)
NOTE: Running task 1627 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1629 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Started
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Started
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic unihash changed to 0ed913aa5d606ac8ef0d012933bd07203a8ed8679aaf5c3ef23112ed2c3cc038
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1630 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: Running task 1631 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Succeeded
NOTE: Running task 1632 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_configure)
NOTE: Running task 1633 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_configure: Started
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1634 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1635 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 3afa4a3006f528c421cbc3c2961d443dba31259586d29cde0133c5de1fd7fb4b
NOTE: recipe libmd-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1636 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_compile)
NOTE: recipe libmd-1.0.4-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1637 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_install)
NOTE: recipe libmd-1.0.4-r0: task do_install: Started
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1638 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_install)
NOTE: recipe xxhash-0.8.1-r0: task do_install: Started
NOTE: recipe libmd-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1639 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_package)
NOTE: Running task 1640 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_populate_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_package: Started
NOTE: recipe xxhash-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_populate_sysroot)
NOTE: Running task 1642 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_package)
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_package: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Started
NOTE: recipe xxhash-0.8.1-r0: task do_package: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_packagedata)
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_packagedata)
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Started
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Started
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1650 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1651 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 1652 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1653 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1654 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_configure: Succeeded
NOTE: Running task 1655 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1656 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1657 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1658 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1659 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1660 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1661 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe db-1_5.3.28-r1: task do_compile: Succeeded
NOTE: Running task 1663 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1664 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1666 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: Running task 1667 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1668 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: Running task 1669 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_install: Succeeded
NOTE: Running task 1671 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: Running task 1672 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 1673 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Succeeded
NOTE: Running task 1674 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_compile)
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1677 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Succeeded
NOTE: Running task 1678 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_install)
NOTE: recipe dpkg-1.21.21-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1680 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 1683 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package)
NOTE: recipe dpkg-1.21.21-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1686 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1687 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1688 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1689 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe dpkg-1.21.21-r0: task do_package: Succeeded
NOTE: Running task 1690 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_packagedata)
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1691 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package_write_rpm)
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1706 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1707 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1708 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1709 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1711 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1713 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_configure)
NOTE: recipe apt-2.6.1-r0: task do_configure: Started
NOTE: recipe apt-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1716 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1717 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_install)
NOTE: recipe apt-2.6.1-r0: task do_install: Started
NOTE: recipe apt-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1718 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package)
NOTE: Running task 1719 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_package: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_packagedata)
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Started
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1721 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_write_rpm)
NOTE: Running task 1722 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_qa)
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1723 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1723 tasks of which 1557 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3906799498936442431==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-2.6.0-2.6.1.patch"

RnJvbSA2OTZmYTIyODk4NDA5MmIxY2Q4YTRkNTY1NWRkNmNjYjYzOWI1NTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwOToxMjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
dDogdXBncmFkZSAyLjYuMCAtPiAyLjYuMQoKLS0tCiAuLi4vYXB0LzAwMDEtRG8tbm90LWluaXQt
dGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoIHwgNCArKy0tCiAuLi5SZXZlcnQt
YWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIHwgNCAr
Ky0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L3thcHRfMi42LjAuYmIgPT4gYXB0XzIuNi4x
LmJifSAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC97YXB0XzIuNi4wLmJi
ID0+IGFwdF8yLjYuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLURvLW5vdC1pbml0LXRhYmxlcy1mcm9tLWRwa2ctY29uZmlndXJhdGlv
bi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQt
dGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoCmluZGV4IDM3YTMxMzMwMTAuLmUw
MWZlYzBkOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEt
RG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQtdGFibGVzLWZyb20t
ZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODQyODBmZWM0
ZTFkMGQzM2VjYTc4ZTc2NTU2MDIzZjhmOGZlNWI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBmNzJkODVmMTQ2YzY3MDMwNDBhOTAzYzJkN2ZiNGVmZTRkMzgyODQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAyMDE5IDE2OjQ3OjM4ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIERvIG5vdCBpbml0IHRhYmxlcyBmcm9tIGRwa2cgY29uZmlndXJhdGlvbgpAQCAtMTMs
NyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvYXB0LXBrZy9pbml0LmNjIGIvYXB0LXBrZy9pbml0LmNjCi1p
bmRleCBiOWQ5YjE1ZDIuLjE3MjVjNTk2NiAxMDA2NDQKK2luZGV4IGI5ZDliMTUuLjE3MjVjNTkg
MTAwNjQ0CiAtLS0gYS9hcHQtcGtnL2luaXQuY2MKICsrKyBiL2FwdC1wa2cvaW5pdC5jYwogQEAg
LTI4MSw4ICsyODEsOCBAQCBib29sIHBrZ0luaXRTeXN0ZW0oQ29uZmlndXJhdGlvbiAmQ25mLHBr
Z1N5c3RlbSAqJlN5cykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0
LzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmV2ZXJ0LWFsd2F5
cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaAppbmRleCA2ZjRk
NWI2ZTcyLi41MzdiYTI4NjQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0
L2FwdC8wMDAxLVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1v
Zi1vdXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZXZl
cnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBhMmRkNjYxNDg0NTM2NDkyYjQ3ZDRjODg5OThmMmJmNTE2NzQ5
YmM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1OTNjMDIwZmUyNTFiMTZmZGEwZmY1
YTc3NjFiMmFlZTIzOWM3ZDY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIxIE1heSAy
MDIwIDIwOjEzOjI1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiYWx3YXlzIHJ1biAn
ZHBrZyAtLWNvbmZpZ3VyZSAtYScgYXQgdGhlIGVuZCBvZiBvdXIKQEAgLTIwLDcgKzIwLDcgQEAg
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL2FwdC1wa2cvZGViL2Rwa2dwbS5jYyBiL2FwdC1wa2cvZGViL2Rwa2dwbS5jYwot
aW5kZXggOTNlZmZhOTU5Li40Mzc1NzgxZDEgMTAwNjQ0CitpbmRleCA5M2VmZmE5Li40Mzc1Nzgx
IDEwMDY0NAogLS0tIGEvYXB0LXBrZy9kZWIvZHBrZ3BtLmNjCiArKysgYi9hcHQtcGtnL2RlYi9k
cGtncG0uY2MKIEBAIC0xMTk5LDEyICsxMTk5LDYgQEAgdm9pZCBwa2dEUGtnUE06OkJ1aWxkUGFj
a2FnZXNQcm9ncmVzc01hcCgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0
L2FwdF8yLjYuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzIuNi4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQv
YXB0XzIuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYu
MS5iYgppbmRleCBiODcyYmU4MzcxLi5mYjRmZjg5OWQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YXB0L2FwdF8yLjYuMS5iYgpAQCAtMjYsNyArMjYsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1u
YXRpdmVzZGsgPSAiIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4t
ZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaCBcCiAgICAgICAgICAgICIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQzNDY3ZDFjYTdkZTZjMDk1NWZkOTkxOTI1NDMzZTIy
ZmE2NjIzMDg3MGU1ZjY2YzQ0OTg2NzVkMDE3NzZjMmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ODZiODg4YzkwMWZhMmU3OGYxYmY1MmEyYWFhMmY0MDBmZjgyYTQ3MmI5NGZmMGFjNjYzMTkzOWVl
NjhmYTZmZCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuR1BMO21kNT1iMjM0
ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIAogIyB0aGUgcGFja2FnZSBpcyB0YWtlbiBm
cm9tIHNuYXBzaG90cy5kZWJpYW4ub3JnOyB0aGF0IHNvdXJjZSBpcyBzdGF0aWMgYW5kIGdvZXMg
c3RhbGUKLS0gCjIuMzkuMgoK

--===============3906799498936442431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6b3ad86b1b131df84ae45b11886e82020170b6d1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 27 Mirrors 0 Missed 61 Current 390 (30% match, 87% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 391 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxcrypt/4.4.33-r0/temp/log.do_packagedata_setscene.919386
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 477 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package_setscene)
NOTE: Running task 894 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 895 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 896 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 968 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 987 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 988 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 989 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 990 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 991 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1093 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: Running task 1094 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_fetch)
NOTE: Running task 1113 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_fetch)
NOTE: Running task 1118 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1180 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1342 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1343 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1344 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1345 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1346 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Started
NOTE: Running task 1347 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1348 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_fetch: Started
NOTE: Running task 1375 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1386 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1387 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1388 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1411 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_unpack)
NOTE: Running task 1412 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: Running task 1429 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Started
NOTE: Running task 1430 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: Running task 1432 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_unpack)
NOTE: Running task 1458 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1459 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: Running task 1460 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1461 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_unpack)
NOTE: Running task 1462 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1466 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 1467 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe apt-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1469 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_patch)
NOTE: Running task 1470 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1471 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1473 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-2.6.1-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 1519 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: Running task 1543 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1571 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_patch)
NOTE: Running task 1574 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmd-1.0.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: Running task 1578 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1579 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: Running task 1580 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Succeeded
NOTE: Running task 1582 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 1610 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1611 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe apt-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1612 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1613 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_generate_toolchain_file)
NOTE: Running task 1614 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1615 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: Running task 1616 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: Running task 1617 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Started
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1618 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1619 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic unihash changed to 0ed913aa5d606ac8ef0d012933bd07203a8ed8679aaf5c3ef23112ed2c3cc038
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1620 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1621 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1622 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: Running task 1623 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1624 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Succeeded
NOTE: Running task 1625 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_configure: Started
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_install)
NOTE: recipe xxhash-0.8.1-r0: task do_install: Started
NOTE: recipe xxhash-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_populate_sysroot)
NOTE: Running task 1628 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_package)
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_package: Started
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1630 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 1072b81eb07d6d62db154a467a22c07e4e4b5a4945f6c206a7641b1b987b622a
NOTE: recipe xxhash-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1631 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_packagedata)
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Started
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_compile)
NOTE: recipe libmd-1.0.4-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_install: Started
NOTE: Running task 1634 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1635 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1636 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_package)
NOTE: Running task 1637 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_populate_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_package: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1638 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1639 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1640 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_packagedata)
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile_ptest_base)
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1642 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1650 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1651 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1652 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1653 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1654 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 1655 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1656 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: Running task 1657 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_configure: Succeeded
NOTE: Running task 1658 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1660 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: Running task 1661 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1662 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1663 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1666 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1667 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1668 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_compile: Succeeded
NOTE: Running task 1669 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_install: Succeeded
NOTE: Running task 1672 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot)
NOTE: Running task 1673 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Succeeded
NOTE: Running task 1674 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_compile)
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1677 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1678 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Succeeded
NOTE: Running task 1680 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_install)
NOTE: recipe dpkg-1.21.21-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 1683 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package)
NOTE: recipe dpkg-1.21.21-r0: task do_package: Started
NOTE: recipe dpkg-1.21.21-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_packagedata)
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Started
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1686 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package_write_rpm)
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1688 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1689 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1691 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1706 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1707 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1708 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1709 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1711 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1713 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_configure)
NOTE: recipe apt-2.6.1-r0: task do_configure: Started
NOTE: recipe apt-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1716 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1717 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_install)
NOTE: recipe apt-2.6.1-r0: task do_install: Started
NOTE: recipe apt-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1718 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package)
NOTE: Running task 1719 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_package: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_packagedata)
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Started
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1721 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_write_rpm)
NOTE: Running task 1722 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_qa)
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1723 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1723 tasks of which 1543 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3906799498936442431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6b3ad86b1b131df84ae45b11886e82020170b6d1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 84 Local 27 Mirrors 0 Missed 57 Current 394 (32% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 395 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxcrypt/4.4.33-r0/temp/log.do_packagedata_setscene.1160057
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 477 of 478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 895 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 896 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 973 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 994 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 995 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 996 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 997 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 998 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 1104 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_fetch)
NOTE: Running task 1105 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: Running task 1124 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_fetch)
NOTE: Running task 1129 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_fetch)
NOTE: Running task 1191 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 1299 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1300 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: Running task 1301 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1302 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1321 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1322 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1334 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1335 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: Running task 1336 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Started
NOTE: Running task 1357 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe apt-2.6.1-r0: task do_fetch: Started
NOTE: Running task 1370 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: Running task 1413 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_unpack)
NOTE: Running task 1414 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Started
NOTE: Running task 1435 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe apt-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1436 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1437 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: Running task 1438 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_unpack)
NOTE: Running task 1469 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe xxhash-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1470 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Started
NOTE: Running task 1471 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.21.21-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1472 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_unpack)
NOTE: recipe apt-2.6.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1473 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: Running task 1474 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Started
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1475 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_patch)
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1476 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmd-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe apt-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1516 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 1529 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-2.6.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1578 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 1579 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1583 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1584 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1585 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1586 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Succeeded
NOTE: Running task 1613 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1615 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1616 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1617 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1618 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: Running task 1619 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe xxhash-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1620 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe dpkg-1.21.21-r0: task do_unpack: Succeeded
NOTE: Running task 1621 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe apt-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 1622 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1623 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_generate_toolchain_file)
NOTE: Running task 1624 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic)
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Started
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1625 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Started
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe xxhash-0.8.1-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1626 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: Running task 1627 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: Running task 1628 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_lic unihash changed to 0ed913aa5d606ac8ef0d012933bd07203a8ed8679aaf5c3ef23112ed2c3cc038
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1629 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1630 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: Running task 1631 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.21.21-r0: task do_patch: Succeeded
NOTE: Running task 1632 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_deploy_source_date_epoch)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1633 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_configure: Started
NOTE: recipe dpkg-1.21.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1634 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1635 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe xxhash-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_install)
NOTE: recipe xxhash-0.8.1-r0: task do_install: Started
NOTE: recipe xxhash-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_populate_sysroot)
NOTE: Running task 1638 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_package)
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe xxhash-0.8.1-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 858ca4af2be69f4c41217e6037b938a21ec9ed3f32b0aad31882c7e7624d489e
NOTE: recipe xxhash-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xxhash-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/xxhash/xxhash_0.8.1.bb:do_packagedata)
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Started
NOTE: recipe xxhash-0.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1640 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_compile)
NOTE: recipe libmd-1.0.4-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_install)
NOTE: recipe libmd-1.0.4-r0: task do_install: Started
NOTE: recipe libmd-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_package)
NOTE: Running task 1643 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_populate_sysroot)
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_package: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1644 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.21.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1645 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_configure)
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1646 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_packagedata)
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Started
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1647 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1648 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1649 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1650 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1651 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1652 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1653 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1654 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_configure: Succeeded
NOTE: Running task 1655 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1656 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1657 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1658 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1659 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1660 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1661 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_compile: Succeeded
NOTE: Running task 1663 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_install)
NOTE: recipe db-1_5.3.28-r1: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1664 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1666 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1667 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: Running task 1668 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_install: Succeeded
NOTE: Running task 1671 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot)
NOTE: Running task 1672 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 1673 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_configure: Succeeded
NOTE: Running task 1674 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_compile)
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1677 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_compile: Succeeded
NOTE: Running task 1678 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe dpkg-1.21.21-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1680 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 1683 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package)
NOTE: recipe dpkg-1.21.21-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1686 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1687 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1688 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1689 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.21.21-r0: task do_package: Succeeded
NOTE: Running task 1690 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_packagedata)
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Started
NOTE: recipe dpkg-1.21.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1691 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb:do_package_write_rpm)
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe dpkg-1.21.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1706 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1707 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1708 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1709 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1711 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1713 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_configure)
NOTE: recipe apt-2.6.1-r0: task do_configure: Started
NOTE: recipe apt-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_compile)
NOTE: recipe apt-2.6.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1716 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe apt-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1717 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_install)
NOTE: recipe apt-2.6.1-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1718 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package)
NOTE: Running task 1719 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_populate_sysroot)
NOTE: recipe apt-2.6.1-r0: task do_package: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe apt-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_packagedata)
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Started
NOTE: recipe apt-2.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1721 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_write_rpm)
NOTE: Running task 1722 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_package_qa)
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Started
NOTE: recipe apt-2.6.1-r0: task do_package_qa: Succeeded
NOTE: recipe apt-2.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1723 of 1723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/apt/apt_2.6.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1723 tasks of which 1557 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.34-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3906799498936442431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apt/apt-bash-completion: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-bash-completion: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt-dbg: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-dbg: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt-dev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-dev: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt-doc: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-doc: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt-locale: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-locale: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt-src: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-src: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt-staticdev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt-staticdev: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt/apt: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt/apt: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/apt: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/apt: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.6.0.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch file://0001-Remove-using-std-binary_function.patch" to "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.6.1.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch file://0001-Remove-using-std-binary_function.patch"
packages/core2-32-poky-linux/apt: PV changed from "2.6.0" to "2.6.1"

--===============3906799498936442431==--

