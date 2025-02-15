Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9000C021BF
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.8092.1739623332933359667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TMHxiRwz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=P3q3yOJh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019509a17977-a9d34a2d-dc1c-42ee-bde2-e386eb5a2a88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VaksxxgwmzFLEqxWfrFLV3uy2oVrZh2AdpHS645y6jU=;
	b=TMHxiRwzcPfmbdfvH0B+vRS5JP7rvM+V9eA+T8yOSQn3hTnsmWizObEhFDxwGTxm
	ZA4lQXYWh8ENU9nGZDMvWIuTh1P47M6feNawx/hEyer20PYMWBy4NGmvXwxng5cYOED
	rN2qt8US6LwHmBz15qqAMDcKJitGXf1Xdjee6zRE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VaksxxgwmzFLEqxWfrFLV3uy2oVrZh2AdpHS645y6jU=;
	b=P3q3yOJhQJw0oR8MJueuMxzqPE5gok8FcI5tgsw+DXEPNx1D/X+zpRY6Nz2IywIe
	BxdE0KidyJvjQuGlpjk/1LMslEkD06ojGpQJ+rMwvhxZ7wBvsEzP+ag8sK6e+u8iSSD
	af6l8eyFNwu14wLeg2aCrf4YBgL5RUyUeImvLEmA=
Content-Type: multipart/mixed; boundary="===============5016902636637840492=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.01.0 FAILED
Message-ID: <0101019509a17977-a9d34a2d-dc1c-42ee-bde2-e386eb5a2a88-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211407

--===============5016902636637840492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.01.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2024.12.0-2025.01.0.patch
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
From 96dafe7b9698d4868f2ff2b91923ddf6f1cd77dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:19:41 +0000
Subject: [PATCH] barebox-tools: upgrade 2024.12.0 -> 2025.01.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index fce3b825ae..9b8dc4ea60 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2024.12.0"
+PV = "2025.01.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f47cd6967b9c4dcab"
+SRC_URI[sha256sum] = "288a838e6fe8897ea46dabd112e42287177353c88a7d442cefc8be8d1a85f5b5"
-- 
2.44.1


--===============5016902636637840492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1870 targets, 49 skipped, 0 masked, 0 errors.
Removing 54 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:97d1cd10275dbf3bca8ba3e5fa7f1dd2c598772f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 232 Local 215 Mirrors 0 Missed 17 Current 242 (92% match, 96% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_populate_lic_setscene)
NOTE: Running setscene task 326 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 333 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-33-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 346 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 347 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 954 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_fetch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 961 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: Running task 971 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 366 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe barebox-tools-2025.01.0-r0: task do_fetch: Started
NOTE: Running setscene task 368 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 972 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_unpack)
NOTE: Running setscene task 370 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 415 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 421 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 432 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 441 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe barebox-tools-2025.01.0-r0: task do_unpack: Succeeded
NOTE: Running task 1103 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_patch)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_patch: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1268 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1331 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1332 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 1333 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 1334 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 1335 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 1336 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1337 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1338 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 1339 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to c7055afb49ba43c130b98a1a6da8f7bf02a90a69273dfddd5fdf30e39093d8e6
NOTE: Setscene tasks completed
NOTE: Running task 1340 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 1341 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1342 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1343 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 1344 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1345 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 1346 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1347 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_package)
NOTE: Running task 1348 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1349 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_prepare_recipe_sysroot)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1350 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_configure)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_configure: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_configure: Succeeded
NOTE: Running task 1351 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Succeeded
NOTE: Running task 1352 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata unihash changed to 1f6b6c2d1a3cdecb06f4a088571964862113dda7e5e9611dc9d6dea46d840c1d
NOTE: Setscene tasks completed
NOTE: Running task 1353 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Succeeded
NOTE: Running task 1354 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_collect_spdx_deps)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 ARCH=sandbox CROSS_COMPILE=x86_64-poky-linux-musl- -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0 O=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/build CROSS_PKG_CONFIG=pkg-config CC=x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot LD=x86_64-poky-linux-musl-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot   targettools_defconfig
| make: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
|   GEN     Makefile
|   HOSTCC  scripts/basic/fixdep
|   HOSTCC  scripts/kconfig/conf.o
|   HOSTCC  scripts/kconfig/confdata.o
|   HOSTCC  scripts/kconfig/expr.o
|   LEX     scripts/kconfig/lexer.lex.c
|   YACC    scripts/kconfig/parser.tab.[ch]
|   HOSTCC  scripts/kconfig/menu.o
|   HOSTCC  scripts/kconfig/preprocess.o
|   HOSTCC  scripts/kconfig/symbol.o
|   HOSTCC  scripts/kconfig/util.o
|   HOSTCC  scripts/kconfig/lexer.lex.o
|   HOSTCC  scripts/kconfig/parser.tab.o
|   HOSTLD  scripts/kconfig/conf
| #
| # configuration written to .config
| #
| make: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
| NOTE: make -j 16 -l 75 ARCH=sandbox CROSS_COMPILE=x86_64-poky-linux-musl- -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0 O=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/build CROSS_PKG_CONFIG=pkg-config CC=x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot LD=x86_64-poky-linux-musl-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot   scripts
| make: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
|   UPD     include/generated/utsrelease.h
|   HOSTCC  scripts/bin2c
|   HOSTCC  scripts/fix_size
|   HOSTCC  scripts/bareboxenv
|   HOSTCC  scripts/bareboxcrc32
|   HOSTCC  scripts/kernel-install
|   HOSTCC  scripts/bareboximd
|   HOSTCC  scripts/dtc/dtc.o
|   CC [U]  scripts/bareboxenv-target
|   CC [U]  scripts/imx/imx-usb-loader-target.o
|   HOSTCC  scripts/dtc/flattree.o
|   CC [U]  scripts/imx/imx-target.o
|   CC [U]  scripts/kernel-install-target
|   CC      scripts/mod/empty.o
|   HOSTCC  scripts/mod/mk_elfconfig
|   CC [U]  scripts/bareboxcrc32-target
|   HOSTCC  scripts/dtc/fstree.o
|   CC [U]  scripts/bareboximd-target
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/imx-usb-loader.c:36,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/imx-usb-loader-target.c:1:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.h:9:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|     9 | int pread_full(int fd, void *buf, size_t size, loff_t offset);
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/imx-usb-loader.c:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c: In function 'read_fd':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c:132:15: error: implicit declaration of function 'pread_full'; did you mean 'read_full'? [-Wimplicit-function-declaration]
|   132 |         ret = pread_full(fd, buf, st.st_size, 0);
|       |               ^~~~~~~~~~
|       |               read_full
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c:200:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   200 | int pread_full(int fd, void *buf, size_t size, loff_t offset)
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/bareboximd.c:18,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/bareboximd-target.c:1:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.h:9:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|     9 | int pread_full(int fd, void *buf, size_t size, loff_t offset);
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/bareboximd.c:19:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c: In function 'read_fd':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c:132:15: error: implicit declaration of function 'pread_full'; did you mean 'read_full'? [-Wimplicit-function-declaration]
|   132 |         ret = pread_full(fd, buf, st.st_size, 0);
|       |               ^~~~~~~~~~
|       |               read_full
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c:200:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   200 | int pread_full(int fd, void *buf, size_t size, loff_t offset)
|       |                                                ^~~~~~
|       |                                                off_t
|   CC [U]  scripts/omap3-usb-loader-target
| make[3]: *** [scripts/Makefile.userprogs:43: scripts/imx/imx-usb-loader-target.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
|   CC [U]  scripts/omap4_usbboot-target
| make[2]: *** [scripts/Makefile.userprogs:28: scripts/bareboximd-target] Error 1
| make[2]: *** Waiting for unfinished jobs....
|   HOSTCC  scripts/dtc/data.o
|   HOSTCC  scripts/dtc/livetree.o
|   MKELF   scripts/mod/elfconfig.h
|   HOSTCC  scripts/mod/modpost.o
|   HOSTCC  scripts/mod/sumversion.o
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/omap3-usb-loader.c:29,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/omap3-usb-loader-target.c:1:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.h:9:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|     9 | int pread_full(int fd, void *buf, size_t size, loff_t offset);
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/omap3-usb-loader.c:30:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c: In function 'read_fd':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c:132:15: error: implicit declaration of function 'pread_full'; did you mean 'read_full'? [-Wimplicit-function-declaration]
|   132 |         ret = pread_full(fd, buf, st.st_size, 0);
|       |               ^~~~~~~~~~
|       |               read_full
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c:200:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   200 | int pread_full(int fd, void *buf, size_t size, loff_t offset)
|       |                                                ^~~~~~
|       |                                                off_t
|   HOSTCC  scripts/dtc/treesource.o
| make[2]: *** [scripts/Makefile.userprogs:28: scripts/omap3-usb-loader-target] Error 1
|   HOSTCC  scripts/dtc/srcpos.o
|   HOSTCC  scripts/dtc/checks.o
|   HOSTCC  scripts/dtc/util.o
| make[2]: *** [/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/Makefile.build:282: scripts/imx] Error 2
|   LEX     scripts/dtc/dtc-lexer.lex.c
|   YACC    scripts/dtc/dtc-parser.tab.[ch]
|   HOSTCC  scripts/dtc/fdtget.o
|   HOSTCC  scripts/dtc/libfdt/fdt.o
|   HOSTCC  scripts/dtc/libfdt/fdt_ro.o
|   HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
|   HOSTCC  scripts/dtc/libfdt/fdt_wip.o
|   HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
|   HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
|   HOSTCC  scripts/dtc/libfdt/fdt_rw.o
|   HOSTCC  scripts/dtc/libfdt/fdt_sw.o
|   HOSTCC  scripts/dtc/dtc-lexer.lex.o
|   HOSTCC  scripts/dtc/dtc-parser.tab.o
|   HOSTLD  scripts/mod/modpost
|   HOSTLD  scripts/dtc/fdtget
|   HOSTLD  scripts/dtc/dtc
| make[1]: *** [/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/Makefile:1036: scripts] Error 2
| make: *** [Makefile:185: sub-make] Error 2
| make: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368:169 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368, line 169
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368, line 153
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368, line 148
| 	#4: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368, line 143
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368, line 182
NOTE: recipe barebox-tools-2025.01.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1354 tasks of which 1320 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215061857.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215061857.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/log.do_compile.956368
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: barebox-tools-2025.01.0-r0 do_compile: oe_runmake failed
ERROR: barebox-tools-2025.01.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.956368' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/log.do_compile.956368
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile) failed with exit code '1'

--===============5016902636637840492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGSIZE changed from 121648 to 122448 (+1%)
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2024.12.0.tar.bz2" to "https://barebox.org/download/barebox-2025.01.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2024.12.0" to "2025.01.0"

--===============5016902636637840492==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2024.12.0-2025.01.0.patch"

RnJvbSA5NmRhZmU3Yjk2OThkNDg2OGYyZmYyYjkxOTIzZGRmNmYxY2Q3N2RkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6MTk6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjQuMTIuMCAtPiAyMDI1LjAxLjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCBmY2UzYjgyNWFlLi45YjhkYzRlYTYw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI0LjEyLjAiCitQViA9ICIyMDI1LjAxLjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjcxN2EyNDE2YjM3OTQyZjU4NGIwYmIyZWI2MWNjYmY4NWRjMGYxYTVjODQxMzE4ZjQ3
Y2Q2OTY3YjljNGRjYWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjg4YTgzOGU2ZmU4ODk3ZWE0
NmRhYmQxMTJlNDIyODcxNzczNTNjODhhN2Q0NDJjZWZjOGJlOGQxYTg1ZjViNSIKLS0gCjIuNDQu
MQoK

--===============5016902636637840492==--

