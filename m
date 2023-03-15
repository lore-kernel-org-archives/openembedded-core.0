Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB0CC87FE1
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.12142.1678895725472218084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MXXAN7Ur;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010186e5fbb817-70597cdc-29e0-4767-bad8-f3fcd0a9d5ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MxqKSrc9Qacn+QQh+cEBmJO2PkSdBH6C91ff+xlNO10=;
	b=MXXAN7Urj5K3RhtJPvjWqcY8P03eVRwd1/3aZ0yAIPmLOsD93YBCI8uMUe/shJRF
	cJ3CstFr6+l3U8IqUag5EjIsJAG7sKJfqs6ML5CdULP/WoDiYPxrjqCOAnJqbQYc5c2
	yDLJvAxQq79L9yJm2c0F9BMV+QxkWj43P5TcJjjo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MxqKSrc9Qacn+QQh+cEBmJO2PkSdBH6C91ff+xlNO10=;
	b=S6wIp4tBSl+bgJPehXcnw8iyzoefHno1Vya09SQwq9rzl/S6m04/bY0JRNtWilgb
	VaBoDA9waZp07sOxCGqGW7Jd3flV+z5GH4xLQFO7LDpS4OsA09DK6rI8sd49pk3nh+8
	Elsn69HcnM5IgO+VpRgMlean6gPIdRIoTQiUPZbI=
Content-Type: multipart/mixed; boundary="===============5757693436425719536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.2.1 SUCCEEDED
Message-ID: <01010186e5fbb817-70597cdc-29e0-4767-bad8-f3fcd0a9d5ed-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178590

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.1.3-6.2.1.patch
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
--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 56 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 6 Mirrors 0 Missed 88 Current 236 (6% match, 73% complete)
Removing 34 stale sstate objects for arch qemuarm...done.
Removing 36 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 248 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: Running task 651 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_fetch)
NOTE: Running task 692 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 780 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_fetch)
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 833 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 852 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 854 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_unpack)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 921 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 958 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 988 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: Running task 993 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: Running task 994 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: Running task 997 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: Running task 998 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: Running task 999 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_unpack)
NOTE: Running task 1000 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: Running task 1001 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1012 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: Running task 1014 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: Running task 1015 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package)
NOTE: Running task 1016 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 1026 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1063 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1072 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: Running task 1073 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: Running task 1087 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: Running task 1091 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 1092 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1094 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_patch)
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1098 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1099 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1100 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic unihash changed to 755d6cca1ab09d23d59644ef22686f8db16c30f27425abdfcb4c046a7e6f76c1
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2fd978f842589a9292ce3577cfe1ab7c53ed8d97f867e72db23eaab6315cd0df
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to b486f33b1148c133eef46ca25e812573d0e16cccda39be5e1823eeafbbad7a8c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1103 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package unihash changed to 098c17258788471ac2922cd8aa6bcfea695b6a7c5d2e73ba66df2bad4aa61f29
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to 322859c573b29cccef241d9f6b895500944c05a222b842f4bc12e49b01e645ff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to a8afd1f561b218206f54950a211c6bd9c6dd8fe5c878cdce7aa94584bd9eac21
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 9d5584f894d27e554c5d1ecaab36b0849637442fe91e64768b8b861802c56155
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running setscene task 324 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package unihash changed to 677fa14c0d7d0cc4e36b2f2f220b5dfb71f21a6bb44d6dc36a070a2a0f1caeb3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 45e5a10948c528415a4882b2eaaed44be8bb7f4c649a37d962eb5f6b5759fbcc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running task 1105 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 1106 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1107 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: Running task 1108 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: Running task 1109 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package unihash changed to 0a8a69e8d8ef08fef4e08358062202c15ac13d7bf5345262e557f86c1f3984fd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package unihash changed to 6ff94f61d2088483146ef9a9203b0d41db9d24cf44014e9c5380d9ceba910878
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1110 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1113 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1119 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1121 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1122 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8c9163c9df5aab90477d2fc57e5646c02f7ff0089ef42ac2f71d262b21c2bfa0
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 79e7067fcd455d44a6e68a7ce6b7d7b8c742c06e101757beeee82f225474b7f2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to 75a5e471eae0f34ff212cc79e4dbfebdb48ce555026fd4a653e643dfa3d03fab
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to d89986568a85626705a2c743bc57bdcc521e9a2316380302a1d45498cc7ace33
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to fa55d45efa6efb501d51062872392e527c0abd76fa12583366505e9ee831fba3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to b6afa724189f934c0c35fab1382bdab308c50df1aadef45963114d5012b00a27
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 10b6c181844f185f379013308cb5a4c3753971e588a2dd271a418fa1ff795c0e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1128 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to 44a9969a705f52b975514c3c4a281bdfccc549caf09fe15d6e49a06a64ce57ca
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package unihash changed to f87cbe346f6697ae4324d24c64b63d6eb2919a0ebe7d85fe5995a498b4ddbf46
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to fada22a86a8390512096b9eaec60b9e2a33daed58e36b56200740129205f1897
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to 302cbf73c3d8671e4d2c14494da1f91c1e268e2b7ccbf673d21212ef3e5b0d72
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1135 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile)
NOTE: recipe openssl-3.0.8-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1136 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1137 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to c9c7c927e1fa103457cfd04a668678c8314ace63ef57372f88ac5d904cad9209
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1140 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1141 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 4203689e482472ae462aa19ef0e56a4dd48010d27a2d7afde834a12c37755b7f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Running task 1144 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 86221c39dbc5c121fd0650c653bd668582fa906a85405a523f1dd3a93f99b19b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1146 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1147 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install)
NOTE: recipe openssl-3.0.8-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1148 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1149 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1150 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1151 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1152 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 68ad8dd59ec508806ecf4097022d6699f4f8a32529bf32c3a75a8d8933a072cb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Running setscene task 321 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1182 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 6313d465a87d84dbe9fe4503cf2c7f875387b7c6415e188380271fc579653f0e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1186 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: Running task 1187 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package)
NOTE: recipe libcap-2.67-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libcap-2.67-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package unihash changed to 31803e0d0c867108ee365a71148e7eeed4c19ee8ed35af10708a886ea760cc48
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 953ba430b9126cb630bd864bf2ce5b8a96b64ed277341ad08db38690b7b1c796
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1192 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1193 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 30c5eb3307c294bda7ac0fe8afb1bdc99685ce26022facd2e6e9f53c7c770e11
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 1195 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1196 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 1197 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1198 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 1200 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1201 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to 7551cdff0e2ede1fb4690f87164eb1e11b4f3e7f385362b786991e11367164e0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 329 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 7fd7039206d4a419b1ea31cb410e7739d165b01aba53cb108347fb8d7ad1dbf8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1203 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1205 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Succeeded
NOTE: Running task 1207 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1209 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_compile: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 1210 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata)
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Failed
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1210 tasks of which 1121 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssl/3.0.8-r0/temp/log.do_packagedata.2098471
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata) failed with exit code '1'

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17379552 to 19632280 (+13%)
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.2.1-py3.11.egg-info

--===============5757693436425719536==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.1.3-6.2.1.patch"

RnJvbSAyNzc3MWFiY2FmNzMyNTM2ZjRlZTY0ZTkwZTJjMDljZDJlOWU1Njk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6MTg6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjEuMyAtPiA2LjIuMQoKLS0tCiAuLi4vYnRyZnMtdG9vbHMv
e2J0cmZzLXRvb2xzXzYuMS4zLmJiID0+IGJ0cmZzLXRvb2xzXzYuMi4xLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMS4zLmJiID0+IGJ0
cmZzLXRvb2xzXzYuMi4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjEuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjIuMS5iYgppbmRleCBiNGRmYzViM2YzLi5hNmZmODdhOTBjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xLjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
Mi4xLmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZzLXByb2dzLmdpdDtiCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Vc2UtcHJlYWQtcHdy
aXRlLWZ0cnVuY2F0ZS1zdGF0LWluc3RlYWQtb2YtNjRiaXQtZXF1LnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDUkVWID0gIjkwOGI0YjQ0NTAzMjBlMzBmZGVmNjkzZjA5YjQyZjRlYjkzNzAyYzMi
CitTUkNSRVYgPSAiMzY2Y2QwNzliYzQzMjQxYjI3ZTA4MzhiZTBjNTM2OWFhMDA3MTZmOCIKIFMg
PSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIgXAotLSAKMi4zOS4yCgo=

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 6 Mirrors 0 Missed 88 Current 236 (6% match, 73% complete)
Removing 36 stale sstate objects for arch mips32r2...done.
Removing 34 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 248 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: Running task 651 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_fetch)
NOTE: Running task 692 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 780 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_fetch)
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 832 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 852 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 854 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 909 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 930 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 967 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 997 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: Running task 1002 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: Running task 1003 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: Running task 1006 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: Running task 1007 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: Running task 1008 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_unpack)
NOTE: Running task 1009 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: Running task 1010 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1019 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: Running task 1023 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1024 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: Running task 1025 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package)
NOTE: Running task 1035 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1063 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1072 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1073 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: Running task 1085 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Started
NOTE: Running task 1091 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: Running task 1092 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1094 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: Running task 1095 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_patch)
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1098 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1099 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1100 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic unihash changed to 755d6cca1ab09d23d59644ef22686f8db16c30f27425abdfcb4c046a7e6f76c1
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 57e05b1499454abd49dd45af1df120eadc692acf40aa62d7cc69ba8fcf025471
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 7165228c3abee48df972aaa4171aa8007a7b5bcdb555ba672a513e96cc910fbe
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: Running task 1104 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to 127690d7ea6a0bb8b061a0bb4c6c76074ef0d9674463a1e87720dc2172a6ac29
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running task 1105 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 495c2667b891c14c1dc617ebadbce5bb7577af05065953f57b40767d654b845a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running task 1106 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1107 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Running task 1108 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package unihash changed to 50871b15f328aa73dfe86836072c8be28b379c213f259dece126d2feca78dfa5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to a0e47c4b01c89640b63bbed39df183fb823b3eb2fbbb6cc5d96c650ee76bed5a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: Running setscene task 324 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running task 1109 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 9959726858ff8155845e59031aff006a48cb18d5bc1ec0b458e98815f9716920
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package unihash changed to da4527c885a80802c1cc05c6291212e9a30232b9aa115450c682a9d12614dc35
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 322 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package unihash changed to a63171f2752a310f1ebb1590148d86f7505e3ce83582e16a8e105a93ba3407c9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata became valid
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package unihash changed to 6c9894aeefa950e43436d25da1a0b1e9d0d3c4c24542993c3ef3e9646f0c9d3d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1114 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1116 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1121 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: Running task 1122 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6a240e84473ce5d69e3e5bb6e4806cca62ac409bd2721dac7f09fd6cb938d81c
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 37d79f15b879cc2a6703a5c101866602a765e0d9d10165fe697708748bd1ebc7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to 90f70bdee21db6c8876635860957c8f13ed0584a46d3c8ad66092e54253ae31c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to a5ab04241c9117ab078bc33571f903cfc07ffe6ce445d3610036a8a4463bfd27
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to b1351f62f6d1392e09a1595420be0e2c08626c7c33f1e96b0cd63f2305149716
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 125460080a2717d63b4e64bed363c3ce0b1d1750455c8a39abdc23d338b4b14a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 5c5ea337c7cefe27136ccc9e536e18e76184a771fefb4f3318b794653df75e8f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1129 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to 5e9244b30a07562a82e14ba2b3227929aac80834196b6fe4b3de693d92ad306c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package unihash changed to 6e8ec8b895c6202838394aa09136120c5d38876fdf689fd188424191674e0a1d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 5986ec264716448aa9ef7b73562fc8030568aea6a838a077614d418f5f95223d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to c7f34ae59a63a30b92ff324ecc071297cf6c9393de60b938eb39892b34d1debb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1135 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile)
NOTE: recipe openssl-3.0.8-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1136 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to af862b4b4203f970f45800bd8b2b0c5f8681b08d0058655464ac72b972c42f8c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1137 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1140 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1141 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to e65988c5c4c6b15322c12cb4b9c9306a8e7c4814f194ccefc7b52d7bf6bb0eea
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to a98bf7a1deec339850597589531b81a86fda983ea5860a93327c0748459eca1b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1144 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1146 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1147 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install)
NOTE: recipe openssl-3.0.8-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1148 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1149 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1150 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1151 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1152 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 7ca01d0f3a38480e18dbeb30d67ec9b304d36b906085370015e9dd48533e6971
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Running setscene task 321 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1182 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to c7d40639783931244ce04404fbde52ad70c319dcb0e66e5b43198cbf1f9b4e96
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1186 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package)
NOTE: Running task 1187 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: recipe libcap-2.67-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libcap-2.67-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package unihash changed to 44f04965d6ca2e53ac6cdbc3464b0750f24741237330bdbd9e4ff83ee0ac9c35
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 10ffda9d184361dc7cb5307a5349b22602ff168c8ca4ef1ade684ced87039db1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 74ab65727923525f2546a8e759743ab38f18559b9e632dd29e8301133d180809
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1193 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1194 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe openssl-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 1195 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1196 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 1197 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1198 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_configure: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to 82575c75cac60164f341635ff25e59ea1910e6bf0f35d99ed15ddd5a7fd5678e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 329 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 1200 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1201 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 3d258ba426c16cdaae5ec0bf3784b1542140cc45529f05bdcf493c26fe6de40e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: Running task 1204 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1205 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Succeeded
NOTE: Running task 1207 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1209 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to f89df194161ff8cb62354f76e98fc6e1e71b692aafc20ede3fd69e461215b87d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 1210 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata)
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Failed
NOTE: recipe python3-3.11.2-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1210 tasks of which 1121 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/openssl/3.0.8-r0/temp/log.do_packagedata.2391017
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata) failed with exit code '1'

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17379552 to 19632280 (+13%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3740233 to 3783396 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.2.1-r0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/mkfs -> /usr/src/debug/btrfs-tools/6.2.1-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/cmds -> /usr/src/debug/btrfs-tools/6.2.1-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.2.1-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/check -> /usr/src/debug/btrfs-tools/6.2.1-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/image -> /usr/src/debug/btrfs-tools/6.2.1-r0/image, directory renamed 
 /usr/src/debug/btrfs-tools/6.1.3-r0/convert -> /usr/src/debug/btrfs-tools/6.2.1-r0/convert, removed "/usr/src/debug/btrfs-tools/6.1.3-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-map-logical.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/help.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/help.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/
 string-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/xxhash.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/xxhash.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/hash.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/sha.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/fsfeatures.h /
 usr/src/debug/btrfs-tools/6.1.3-r0/common/units.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/hash.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/units.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/ioctl.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/sha224-256.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/messages.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2-impl.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/messages.c /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-find-root.c /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-select-super.c /usr/src/debu
 g/btrfs-tools/6.1.3-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/crc32c.h /usr/src/debug/btrfs-tools/6.1.3-r0/kerncompat.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/crc32c.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2b-ref.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfstune.c", added "/usr/src/debug/btrfs-tools/6.2.1-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.2.1-r0/btrfs-map-logical.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/help.h /usr/src/debug/btrfs-to
 ols/6.2.1-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/sha224-256.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/help.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/blake2.h /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/blake2b-sse41.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.2.1-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/xxhash.h /usr/src/debug/btrfs-tools/6.2.1-r0/tune/change-uuid.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/hash.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/open-utils.h /usr/src/debug/b
 trfs-tools/6.2.1-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/sha.h /usr/src/debug/btrfs-tools/6.2.1-r0/include/ioctl.h /usr/src/debug/btrfs-tools/6.2.1-r0/tune/tune.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/units.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/hash.h /usr/src/debug/btrfs-tools/6.2.1
 -r0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/units.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.2.1-r0/common/messages.h /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/blake2-impl.h /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/tune/main.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/messages.c /usr/src/debug/btrfs-tools/6.2.1-r0/btrfs-find-root.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/blake2b-avx2.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/blake2b-sse2.c /usr/src/debug/btrfs-tools/6.2.1-r0/btrfs-select-super.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools
 /6.2.1-r0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/sha256-x86.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/crc32c.h /usr/src/debug/btrfs-tools/6.2.1-r0/tune/change-csum.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/crc32c.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.2.1-r0/btrfs.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.2.1-r0/crypto/blake2b-ref.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.2.1-r0/tune/seeding.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/crc32c.c /usr/src/debug/btrfs-tools/6.2.1-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.2.1-r0/libbtrfs/crc32c.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.1.3" to "6.2.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6156440 to 6328528 (+3%)
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.1.3 [default] to 6.2.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.1.3" to "6.2.1"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.2.1-py3.11.egg-info

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1793 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1791 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 4 Mirrors 0 Missed 88 Current 238 (4% match, 73% complete)
Removing 33 stale sstate objects for arch qemux86_64...done.
Removing 35 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 250 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Started
NOTE: Running task 665 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 702 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_fetch)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 783 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 867 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 868 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: Running task 869 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 891 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: Running task 894 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 899 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: Running task 917 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: Running task 925 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_fetch)
NOTE: Running task 926 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: Running task 947 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: Running task 948 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Started
NOTE: Running task 965 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: Running task 966 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 967 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package)
NOTE: Running task 1003 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1023 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1069 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: Running task 1070 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: Running task 1084 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: Running task 1088 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1090 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: Running task 1091 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1092 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1094 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1095 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_patch)
NOTE: recipe openssl-3.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1096 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1097 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1098 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1099 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1100 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1101 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic unihash changed to 755d6cca1ab09d23d59644ef22686f8db16c30f27425abdfcb4c046a7e6f76c1
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to eaf3c63a2d7616fe02c0eaebdb7f288f8e8723f59c959bf3069afcb602f96417
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to fb3720376348c164952306540ce6f04474e12bab6a07c2389b538d3ef135f414
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to f579c9fd9250736190318977c744edf9787e5805e2f9e6e6cc7bc076be4b9b2a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package unihash changed to 114ca41c77cc0640d7e41258a77046cdd33c7de0f062841386caeafa5ed65ed1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 329 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1104 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1105 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to f997d3b323eac7290ef6827b608010e1aa464e1c79ee81112924c79f9224950d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running task 1106 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to 43c84ac9b8097742c627183e39975f0989466fb1d0cb00bca271c803b5b74cf6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running task 1107 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package unihash changed to 8cb92f699b40d570c4bbd0142d802f99d8301539c22ad450d1f3b3d1c0e42217
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running task 1108 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 09d4cbda9e655cd67607c1890e01823f6006224681a976b51797d921bebc7cd5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1109 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package unihash changed to b07e423a474cd65f25ca92c41833867608f921117e6b3d4dda1b094db6a2cdfc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata became valid
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1114 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package unihash changed to 4b2c25547ff1e0ce72cfd58ae77a46019330a13d41186e2bb44784d7766b249e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata became valid
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1117 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1121 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1122 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to bc44602d23f5e90668311c9434de006378849ba78d836815fdaf065c3fe5268c
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to 7a336f36434fca1fe9bc5ee200d7155c2ab55651fa1afd893fd7bc9fc7f500c0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 331a89a7d166cfc495f57ab120a0a82f02f42d8b46269d7ed6e5004ad45541d4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 0660ad89ad23276116ea57b2c0a31e34cc593fd2067505955052cb7e329105a2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to 395d5a1abbe0701d69fe5c975287a11eadf7c0cd6c3650a45de78cc5046f82fe
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 2174ad100900f34ac350a284040c3f33d9b316bd2fbdbb8b43103d231f4f18a4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to a4b2e74ee9a4e64befb0e0a014007d532150e95bcedd3fd6a49ca6b012a36205
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1129 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to 08e1a53d8adba3974b2bd66037916a9af0eb3fdc4a70dbdefd7bf081a55ba0e8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package unihash changed to c07e9000e7a651500d5df0f4fbd4bfcbdd6ccf34c9b2bf1b1e2b0744c68bb79b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 1dcddd7a0ea1c6952d9fc6e4940ed95503aa385635524980dd28655ca4131753
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to d962f142b4800985ae29d9263853a3f813a96125fde521e2dc4832734e6b4943
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1134 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1135 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1136 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1137 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile)
NOTE: recipe openssl-3.0.8-r0: task do_compile: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to b4cc37654f99f73493769aa166e5a56729980c117fb8a1af3c34b0a97a66efa8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1140 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1141 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 901d9d97407e4f0f2aae9b622a85dc0f8f639937251947c85c952cf20b4e2639
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to c3372f47adaa32df1e87a02257c5c33dceaa6f9d5fdd0a44b2780a37072ee956
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1144 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1146 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1147 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install)
NOTE: recipe openssl-3.0.8-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1148 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1149 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1150 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1151 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1152 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 12d341722afae726aa30b3f636395b39e7ae3c2c9d865ce113050a494f668196
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 321 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1182 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 5bd602ea6cb5d7b990e4050b972e235284f3d470a77261ee3e1550272242675d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1186 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: Running task 1187 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package)
NOTE: recipe libcap-2.67-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libcap-2.67-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package unihash changed to 894de740f07946652392e8f960005503c64ac44216f31aae89883a3c231c48bd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to f0f30cdd0b0046395097a4b5ddf1c4fff326ba7b70d366ab9b3bffc272d6037a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 81ae0a9e5de97f4887d9b640f37773a02316e12c476255235f4ad577ce9cac6b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 1192 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1194 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe openssl-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 1195 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1196 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 1197 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1198 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 1200 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1201 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to 1c992506c0a97f085634c7f8c3b69698bd9545912a64e5e241183404ccd927b0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 329 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 3de1e74a5d0d141b94f8b743a33b990d16ff67d30776409f9e5fe749b0f099fd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Setscene tasks completed
NOTE: Running task 1204 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1205 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Succeeded
NOTE: Running task 1207 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1209 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to ce0aa31e6cdbdd0c9021eeb4613790f254285d40f22a05da753b0c546927d9e5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: Running task 1210 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Failed
NOTE: recipe python3-3.11.2-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1210 tasks of which 1121 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/openssl/3.0.8-r0/temp/log.do_packagedata.1807545
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata) failed with exit code '1'

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 6 Mirrors 0 Missed 88 Current 236 (6% match, 73% complete)
Removing 34 stale sstate objects for arch qemuppc...done.
Removing 36 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 248 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: Running task 651 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_fetch)
NOTE: Running task 692 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe autoconf-archive-2023.02.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022g-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 780 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_fetch)
NOTE: Running task 833 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 852 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 853 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_unpack)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 902 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 923 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 960 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 990 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: Running task 995 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: Running task 996 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: Running task 999 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: Running task 1000 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: Running task 1001 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_unpack)
NOTE: Running task 1002 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: Running task 1003 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1012 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: Running task 1016 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 1017 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package)
NOTE: Running task 1018 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: Running task 1028 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: Running task 1064 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1072 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: Running task 1073 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: Running task 1086 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1091 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1093 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1094 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_patch)
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1098 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1099 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure)
NOTE: Running task 1100 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic unihash changed to 755d6cca1ab09d23d59644ef22686f8db16c30f27425abdfcb4c046a7e6f76c1
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 218417b2dfed6baddf94a3ec9119553c544706652ce46c0b749bf3d2d59be9e5
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 00652c0724e5f011cfceee5ce291e717aeaeac5698f25fc8480af8ec62491dfe
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1104 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1105 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 1106 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1107 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to 8638e99a98b41087372c72877b27d41f45221cd89e64c40e3f769dd976d518a4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 947aa433712febd292b87eaecb481abb2de683c202b8036f077397b02bc36297
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package unihash changed to b42fcf93ac02f3ccfaaf49ee1652451cd7a4c6fcbc5cf71c9880b8341c468b9a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: Running setscene task 310 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package unihash changed to 4bcb289a00485a5f1f9dbc647b49bfa1bc955c32622e8f3a303b5f2dbbe7a6b3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata became valid
NOTE: Running setscene task 323 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Running setscene task 326 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running task 1108 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to d34eb9d96fa5ab1cb9174890c9ca476bb1ea94b04cd65e7bf77a5b61ea98d8f2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running task 1109 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 334095ed96f02560b2d98237f65137a21d832336452e48fdefc55a5d844a60b3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package unihash changed to b9fce44230283f6b970ff97181c89f939f9a5a594c484a604e6d89fb0d22fa0d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package unihash changed to e054c1e1b2f508409f91f91738bf80cbc9932b3f9d6a76117000bd994bff2db4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 1115 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1116 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1121 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: Running task 1122 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 939d37d6158c1b021c4a4e87625a2c6699a2cf612100fe6402822e98ca499105
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to f529b133b7bf530d63018c68f2f8b0f92979a46c79b2876fe5930cbba95f4b06
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 150a5052ca3b27281858990d6e2c47c76c044c5fa77f2985f2814ce33c6a784b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to 15ced43dc87380003017f35efd5fe84533310c4aaa23327678bf6f0ae8d7b69d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 44091a3c0b9da993617d0c08bf8739db14ca84ca02314db1f9343fc86c69be13
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to ad7176c27335c19ac6dc1a2dbe34fa0739ea53bcd1de2d589ae643bfb83ecb01
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to d705de58b04b6d35c087739fb83b6bba9b0ee2d57100ebc997766f0bafbf07d1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1129 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to d034112a88e800b1ea369f4f49acf054a55440427ee4667d283ec3397142e478
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package unihash changed to 5e90c1a3e7e2b3968426758a358f381bd296de015be639801b000fbbed9ef922
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to e73149f5dcfee1af0f4f19789a06b183cf66fbca0d6671c8b01c9b489aa7aa89
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to b9d624256dec5cffd1933d30c34b7f7f1f504bf1963f83a355a59819d294c6cd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1135 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile)
NOTE: recipe openssl-3.0.8-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1136 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to a0cfe2951c177f07639bafe1f7d49d40330615ccf87e0c29c47301d964ce4a85
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1137 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1140 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to d4975f854210a6dde88dc29b206821c3999a491839d291731c14b52db1cb6348
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1141 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 4bf46360485a252d6bb913ee0cccea4c4353669b3be67e3f6f12fccbe1646b0d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1144 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1145 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1146 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1147 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install)
NOTE: recipe openssl-3.0.8-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1148 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1149 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1150 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1151 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1152 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 0cbebcd56015a8008ebc93260fa4d268e31bd84cb6f4fb3cdd11413c3641c6ff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot became valid
NOTE: Running setscene task 321 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1182 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 90baccfefa5633cbb15741d003a0128ffa3e181ebbac31b8df536286df4b11de
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1186 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: Running task 1187 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package)
NOTE: recipe libcap-2.67-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libcap-2.67-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package unihash changed to f95d263946c75f59009d55f9aaebbe748e03059fb4c01ad89f8f095b40476ff6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 47845283d69313cb52c5fc01dcbf3381dd3af443ff55a6af838b76e3371a7eb4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1192 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1193 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 71efc481b525cdadb7b26b0d00b3ac31d14dce23906c82c07eea1230aaebdb51
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 1195 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1196 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 1197 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1198 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 1200 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1201 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to 93e9cb432c76c113a8f5904ef45f7d175248654592caae922a567d26e6ee0a02
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 329 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 6e8827013a545c867026873c4521fc0fc0f6fe8640beace7e05d30e4f310476a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: Running task 1203 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1205 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Succeeded
NOTE: Running task 1207 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1209 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to 6e03a0f7dfd4d334f96b4bfe0205cbc1aa138962cf9c43a46eae2836c7efcfb6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 1210 of 1228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata)
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Failed
NOTE: recipe python3-3.11.2-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1210 tasks of which 1121 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/openssl/3.0.8-r0/temp/log.do_packagedata.2682607
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata) failed with exit code '1'

--===============5757693436425719536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 50 skipped, 0 masked, 0 errors.
Removing 82 recipes from the core2-32 sysroot...done.
Removing 86 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 168 Local 71 Mirrors 0 Missed 97 Current 158 (42% match, 70% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 159 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 173 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 179 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 191 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 192 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 213 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 214 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 568 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_fetch)
NOTE: Running task 569 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 570 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 573 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 574 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_fetch)
NOTE: Running task 575 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 576 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_fetch)
NOTE: Running task 577 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_fetch)
NOTE: Running task 579 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 629 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_fetch)
NOTE: Running task 663 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libcap-2.67-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 709 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 710 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 711 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 712 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running task 713 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 718 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Started
NOTE: Running setscene task 256 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 259 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 270 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 272 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 719 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 279 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe xz-5.4.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.67-r0: task do_fetch: Started
NOTE: Running setscene task 280 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 282 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 283 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 720 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_unpack)
NOTE: Running task 721 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.67-r0: task do_fetch: Succeeded
NOTE: Running setscene task 285 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 722 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 723 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_unpack)
NOTE: Running task 724 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 287 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 725 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: Running task 726 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 727 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 728 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 729 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 730 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 731 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 732 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.67-r0: task do_unpack: Started
NOTE: Running task 733 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 734 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 735 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 736 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 737 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 738 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 739 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 740 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 741 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 742 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 743 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 744 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 745 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: Running task 746 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_patch)
NOTE: recipe xz-5.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: Running task 747 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: Running task 748 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_patch)
NOTE: recipe libcap-2.67-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: Running task 749 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 288 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: Running task 750 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 290 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: Running task 752 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 753 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 291 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: Running task 754 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: Running task 755 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 757 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 758 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: Running task 759 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 760 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.67-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_patch: Started
NOTE: Running task 761 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 763 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 764 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: Running task 765 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 766 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_patch: Succeeded
NOTE: Running task 767 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: Running task 768 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 769 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: Running task 770 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 771 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 772 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_fetch)
NOTE: Running task 773 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 774 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.67-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 775 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 777 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 296 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_setscene)
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: Running setscene task 297 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 298 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: Running setscene task 300 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 782 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_unpack)
NOTE: Running task 783 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: Running task 784 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 785 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 786 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_patch)
NOTE: Running task 787 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 788 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: Running task 791 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: Running task 792 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 793 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 795 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_patch)
NOTE: Running task 796 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 798 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: Running task 800 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 801 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 804 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: Running task 806 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 807 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: Running task 808 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 809 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 810 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: Running task 812 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 813 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: Running task 816 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 818 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 821 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 822 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.8-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 823 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 302 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 826 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 827 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Succeeded
NOTE: Running task 829 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb:do_populate_lic unihash changed to 755d6cca1ab09d23d59644ef22686f8db16c30f27425abdfcb4c046a7e6f76c1
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 303 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 837 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Succeeded
NOTE: Running task 838 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 843 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 310 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_patch: Succeeded
NOTE: Running task 864 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 865 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 323 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ba3746df05eabf3927798dd94e2320be4e35e0260cfd0af69bed798de504f77f
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 932 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 938 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 943 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 944 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 945 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 946 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 951 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 952 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 953 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 954 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 955 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 956 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 957 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 958 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure)
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.13-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 959 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 960 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 961 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 962 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 963 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 964 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_configure)
NOTE: Running task 965 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: Running task 966 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 985103717a83f6077abb0e5a0edc91148f672ca0f9b79af2d10d906cde13d811
NOTE: Running task 967 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: Running task 968 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Succeeded
NOTE: Running task 969 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_compile)
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_configure: Succeeded
NOTE: Running task 970 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Succeeded
NOTE: Running task 971 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_install)
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 972 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile)
NOTE: recipe zlib-1.2.13-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Succeeded
NOTE: Running task 974 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 975 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 976 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 977 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 978 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 979 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: Running task 980 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 981 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 982 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe openssl-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 983 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_configure)
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 984 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 985 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure)
NOTE: Running task 986 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_configure)
NOTE: Running task 987 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 988 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_configure: Started
NOTE: Running task 989 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe xz-5.4.1-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile: Succeeded
NOTE: Running task 990 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 991 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install)
NOTE: recipe zlib-1.2.13-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_install: Succeeded
NOTE: Running task 992 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 4434d2e4c479072eba0311b8a5b458bb5b1a9b9e897a7ba764f93a0d0d88610f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 994 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 995 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe cracklib-2.9.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 997 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_configure)
NOTE: recipe cracklib-2.9.8-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 998 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 999 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to d59745ac42ba83c403ebb69d5fab8af9969ff11f9755856cdc54132afa37362f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: Running setscene task 319 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1001 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1002 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1009 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package unihash changed to 2ffeff4439944ed7e6ed8cf78198123c3384f2ca6c3eb2f0c287fd3f64253e85
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1010 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_compile)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.41.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1012 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1013 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 1015 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1016 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1017 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1018 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1019 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1020 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1021 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1022 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1023 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1024 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1025 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: Running task 1026 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1027 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1028 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1029 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1030 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1031 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1032 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1033 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1034 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1035 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 1037 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1038 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1039 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1040 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_compile)
NOTE: recipe cracklib-2.9.8-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1041 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1042 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1044 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1045 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe cracklib-2.9.8-r0: task do_compile: Succeeded
NOTE: Running task 1046 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1047 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe cracklib-2.9.8-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1048 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: Running task 1049 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: Running task 1050 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1051 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1052 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 26294f9aa85558b31a6368cac364202a4ce319d089d547d5e1e095b331cfec48
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1053 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_configure: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 1055 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 56db83149416671747154c140d6b378f052fe88074138f1cbbe28d051aea1fbc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1056 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1058 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.8-r0: task do_install: Succeeded
NOTE: Running task 1060 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1061 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running task 1062 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1063 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1065 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1066 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 7333c10fc6de7e058b81cbcd3daad700dd2b30f17647832e54105d751f15db92
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xz-5.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1068 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_compile)
NOTE: recipe xz-5.4.1-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to 7032238ff2b01ab104950e958cb3f25ee0df8ed5e7274b8a9f8c761d7bf6464f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 321 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to f6b9512e5a1a133e45405fedc9f285851e53ceebbfb22bec3251c8ef69298b74
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xz-5.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1071 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_install)
NOTE: recipe xz-5.4.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1072 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1073 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1074 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1075 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1076 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1077 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1078 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe xz-5.4.1-r0: task do_install: Succeeded
NOTE: Running task 1079 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot)
NOTE: Running task 1080 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1081 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1082 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1083 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1084 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1085 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Started
NOTE: recipe ncurses-6.4-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1086 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_compile_ptest_base)
NOTE: Running task 1087 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_compile)
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe ncurses-6.4-r0: task do_compile: Started
NOTE: recipe openssl-3.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1088 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1089 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: Running task 1090 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1091 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1093 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1095 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to ab1f2d7dbdb54db6182c9c81b68654f53c35eb4e23384e86e90dedc5f8006ba0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Running task 1097 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata)
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1098 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1099 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to dea9f3aba3128b2295751311ec68bb6b1cd05b3b8fba90d49fbb8dccf51536ae
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1101 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1102 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1103 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1105 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1106 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1107 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe ncurses-6.4-r0: task do_compile: Succeeded
NOTE: Running task 1108 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to 725089bc918c85fe22cc89bc9feedb66cd3c549bc4449dc03421f68734d0ff61
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 37da78c8c802a7d638766c93b45b999251ed72734d5b8ac6a4041194ee91fd3e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ncurses-6.4-r0: task do_install: Succeeded
NOTE: Running task 1112 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1113 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1114 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1115 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1116 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1117 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1118 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: Running task 1120 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1121 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1122 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1123 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 8beb48026e015ba1897f9111333223a4dfaee4523e7ae4d84aa8f86f8c38e363
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot became valid
NOTE: Running setscene task 323 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot_setscene)
NOTE: Running task 1125 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_install)
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1127 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1128 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.67-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1129 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_configure)
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.67-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_install: Succeeded
NOTE: Running task 1130 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_configure)
NOTE: recipe util-linux-2.38.1-r0: task do_configure: Started
NOTE: Running task 1131 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_populate_sysroot)
NOTE: Running task 1132 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_package)
NOTE: recipe libcap-2.67-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1133 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_configure)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Started
NOTE: recipe libcap-2.67-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_configure: Started
NOTE: recipe libcap-2.67-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to 1d933d022d200ac5acffa77d55a7021c3ac36cb4096acd0df47c75ead0ca149e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1136 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_package: Succeeded
NOTE: Running task 1137 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata)
NOTE: recipe libcap-2.67-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata: Started
NOTE: Running task 1138 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_install)
NOTE: recipe libcap-2.67-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata: Succeeded
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to f446a2ad046e667cd660d1dd8da4bfc31bc3e08a3e1cd0522d9f3c374675e19b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1142 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1143 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1144 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 99e3935b8d5736bd5990ebe37213d96edc87913bcf046382bbcdfd8c54815f65
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1146 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package)
NOTE: recipe libcap-2.67-r0: task do_package: Started
NOTE: recipe openssl-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 1147 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-2.67-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_package unihash changed to fa448618057615ed9468be048b658e404681d0896957af978af21936da6c4bca
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1149 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 1150 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_package)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1151 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1152 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1153 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_configure: Started
NOTE: recipe shadow-4.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1155 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_compile: Succeeded
NOTE: Running task 1156 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_install)
NOTE: recipe shadow-4.13-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_install: Succeeded
NOTE: Running task 1158 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: Running task 1161 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1162 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: Running task 1163 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1164 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1165 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_compile)
NOTE: recipe util-linux-2.38.1-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 9bdae8f7909a9307e1b28ae6deec22cd164da99efcd95de043453e6a5cbcec2b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1167 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 8e640d37e3d44fa0f46ec19de4f14f24393c564f4aba45a065596fa3a74101cb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1169 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1170 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1171 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_install)
NOTE: recipe util-linux-2.38.1-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1173 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1174 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1175 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1176 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 949e451a56ae5643533657f04ad4a52900eaf4778cd6493688743bda890da6ea
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 326 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.11.2-r0: task do_configure: Succeeded
NOTE: Running task 1178 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1179 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1181 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1182 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1183 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to 850da14c79ed9c5496ea3ec33c7ca53a69590db09d6c671c0db3f2770eaf5ac1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 325 of 326 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.11.2-r0: task do_compile: Succeeded
NOTE: Running task 1185 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1186 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_install)
NOTE: recipe python3-3.11.2-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1187 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1188 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1189 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1190 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe openssl-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 1191 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata)
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: Running task 1192 of 1213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata: Failed
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1192 tasks of which 867 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.0-r0 to 0:3.0.8-r0) [version-going-backwards]
ERROR: openssl-3.0.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/openssl/3.0.8-r0/temp/log.do_packagedata.3037941
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata) failed with exit code '1'

--===============5757693436425719536==--

