Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3E8C83F35
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12168.1752594936051581935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W6+1N+VY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=n5wqJpDM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101980ecc6dc2-bfe5deab-4aff-4245-b2a6-d4fb41ba6497-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DgwbCREGkj5zvE54Fu+iZ+7bZLVtEWBn6MUrhjTX0B8=;
	b=W6+1N+VYof6k2t+C1PQWY+gWJh0kjmXSkYZMs+K8fV9Ey9yyJ9VCkodYm3p7Boyn
	Qd5WdOExWAPiKJK4VjVNmfpFwTMYMZ0wziR8vvMy9iyvFpuA3zRoImZz6mrMxiETVZJ
	zhWrwejLSfbXHEDhBhKk2hakJQsdoinagD2q6Ooo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DgwbCREGkj5zvE54Fu+iZ+7bZLVtEWBn6MUrhjTX0B8=;
	b=n5wqJpDMDb1Fxiv9/ido1c7woucutEItRfeaw33ary7mHYchdNsz6yZKNok3nv7b
	kDqrdR+fYqoAXKQ1wTgFOySzSEu2Ryi3rzbfS2jUqlhqPClYewpat110jtmw5YTbZp4
	4gKHbvMKZxfaOUR8PQuGui5unbEA2+mm4SwseM4E=
Content-Type: multipart/mixed; boundary="===============4878963405903067875=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.07.0 SUCCEEDED
Message-ID: <010101980ecc6dc2-bfe5deab-4aff-4245-b2a6-d4fb41ba6497-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220324

--===============4878963405903067875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.07.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.06.0-2025.07.0.patch
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

-- >8 --
From fa2dce27032898d0dc82962cf92f117241db16ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 08:04:45 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.06.0 -> 2025.07.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 67bc964188..a9a6a91db9 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.06.0"
+PV = "2025.07.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "d05bc1f85dc1d95b0b6b6a52cac0a469148fbb8f1edb0d352c3ca3b632426941"
+SRC_URI[sha256sum] = "92add334bd0f5847deb2c23da54c78b40e8bae4f93c545e62be28e2f0afe137b"
-- 
2.47.1


--===============4878963405903067875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (0 cached, 941 parsed). 1929 targets, 50 skipped, 0 masked, 0 errors.
Removing 52 recipes from the core2-64 sysroot...done.
Removing 51 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-2c0c2d942831eb2cdd1827f183e6d173bf27d44b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2c0c2d942831eb2cdd1827f183e6d173bf27d44b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 223 Local 200 Mirrors 0 Missed 23 Current 243 (89% match, 95% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_populate_lic_setscene)
NOTE: Running setscene task 319 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 326 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 345 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 346 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 347 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 355 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 359 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 365 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 850 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 852 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: Running task 856 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 897 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 911 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_recipe_qa)
NOTE: Running setscene task 373 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 914 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_recipe_qa: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Succeeded
NOTE: Running task 981 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 982 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Running task 983 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_fetch)
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_fetch: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: Running task 984 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_unpack)
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.41/temp/log.do_packagedata_setscene.2327550
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 382 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 987 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 988 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_unpack: Succeeded
NOTE: Running task 990 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_patch)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_patch: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_patch: Succeeded
NOTE: Running task 991 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_deploy_source_date_epoch)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 383 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 407 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 409 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 411 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 435 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1237 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1273 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata)
NOTE: Running task 1297 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1299 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 1301 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 1302 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running task 1303 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: Running task 1304 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 5e79bddddc28486c2b4cc2e3778c1134050d5d8ffaa7172343e2901e3bb14f69
NOTE: Setscene tasks completed
NOTE: Running task 1305 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1306 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 7e5af703e2f96c13826c6889ae54cf428144c6cb8aeb7524800b1a7c26999797
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 466 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1308 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1309 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1310 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 1311 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 1312 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 1313 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1314 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1315 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure)
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 1316 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 212ec09bceea79c989ad0d46a57d04d7cc40f16700ce55e4e9495582f3297d40
NOTE: Setscene tasks completed
NOTE: Running task 1317 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 1318 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1319 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1320 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Succeeded
NOTE: Running task 1321 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1322 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install)
NOTE: recipe libusb1-1.0.29-r0: task do_install: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install: Succeeded
NOTE: Running task 1323 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1324 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_package)
NOTE: Running task 1325 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.29-r0: task do_package: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1326 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_prepare_recipe_sysroot)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1327 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_configure)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_configure: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_configure: Succeeded
NOTE: Running task 1328 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.29-r0: task do_package: Succeeded
NOTE: Running task 1329 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata)
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata unihash changed to 117c2e61e1937ace63cdc34315fd2b1781ba54e2922b451162be2cd700c0bc22
NOTE: Setscene tasks completed
NOTE: Running task 1330 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Succeeded
NOTE: Running task 1331 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_collect_spdx_deps)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1332 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_install)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_install: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_install: Succeeded
NOTE: Running task 1333 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_package)
NOTE: Running task 1334 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_populate_sysroot)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_populate_sysroot: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package: Succeeded
NOTE: Running task 1335 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_packagedata)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_packagedata: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1336 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_create_spdx)
NOTE: Running task 1337 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_package_write_ipk)
NOTE: Running task 1338 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_package_write_deb)
NOTE: Running task 1339 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_package_write_rpm)
NOTE: Running task 1340 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_package_qa)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_create_spdx: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_write_ipk: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_write_deb: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_write_rpm: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_qa: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1341 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_create_package_spdx)
NOTE: recipe barebox-tools-2025.07.0-r0: task do_create_package_spdx: Started
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_qa: Succeeded
NOTE: recipe barebox-tools-2025.07.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1342 of 1342 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_build)
NOTE: Tasks Summary: Attempted 1342 tasks of which 1282 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 166 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bits went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-coresched went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fcntl-lock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4878963405903067875==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.06.0-2025.07.0.patch"

RnJvbSBmYTJkY2UyNzAzMjg5OGQwZGM4Mjk2MmNmOTJmMTE3MjQxZGIxNmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDg6MDQ6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjUuMDYuMCAtPiAyMDI1LjA3LjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCA2N2JjOTY0MTg4Li5hOWE2YTkxZGI5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI1LjA2LjAiCitQViA9ICIyMDI1LjA3LjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQwNWJjMWY4NWRjMWQ5NWIwYjZiNmE1MmNhYzBhNDY5MTQ4ZmJiOGYxZWRiMGQzNTJj
M2NhM2I2MzI0MjY5NDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTJhZGQzMzRiZDBmNTg0N2Rl
YjJjMjNkYTU0Yzc4YjQwZThiYWU0ZjkzYzU0NWU2MmJlMjhlMmYwYWZlMTM3YiIKLS0gCjIuNDcu
MQoK

--===============4878963405903067875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.06.0.tar.bz2" to "https://barebox.org/download/barebox-2025.07.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PV changed from "2025.06.0" to "2025.07.0"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2025.06.0 [default] to 2025.07.0 [default]

--===============4878963405903067875==--

