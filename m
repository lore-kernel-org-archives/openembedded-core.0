Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142DCC83F3B
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12164.1752594932763452332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Grojgxc2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sU/wMexF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980eccb001-cb19dbbf-3d0a-456e-b9c5-1864f134156b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594952;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AT8T+uOcbqhC7lW69iSfp7weRtM0xpNclwlRXDx6R2E=;
	b=Grojgxc2Pzu3OAyBG4Y9yvEd9JMiCTsLdopQGeO4jCam20kyyGz8M0fbT2gVO/Ml
	E4e4Ps5FBJRFChAIrVQPb/gb4ZbVKmBw7G79+S6Qlv2EQnAO/WtiOBini5/JqnQJnJp
	gXzU5rMv/nl+WC7JAmV+R3upcNM5c15fcVLVm1iI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594952;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AT8T+uOcbqhC7lW69iSfp7weRtM0xpNclwlRXDx6R2E=;
	b=sU/wMexFPv2d+mcDqxKZWe3Xttblb1gZJCu27qZDXX8qcPNO1rVTAquZoaAWIH2B
	UyanaA4KmXJP+K9f3Yl10Os8KiqG6683P/PSygD1vUO0KyjktezWhq015mrQwB4HiOw
	/15/GbfoKwXaT6iKzaoMJqWgjN+4ecPao2UlV6y8=
Content-Type: multipart/mixed; boundary="===============6820203679571483359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xserver-xorg: upgrading to 21.1.18 SUCCEEDED
Message-ID: <010101980eccb001-cb19dbbf-3d0a-456e-b9c5-1864f134156b-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220385

--===============6820203679571483359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.16-21.1.18.patch
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
From a50b662643809b1be60a07976625aa071cc4201d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:18:22 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.16 -> 21.1.18

---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch        | 2 +-
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index e9cbc9b4da..b370f81fe1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
+From 25da4e354a5c876cd0747228c84ec5c37d875897 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 17 Aug 2020 10:50:51 -0700
 Subject: [PATCH] Avoid duplicate definitions of IOPortBase
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index a196e50751..2f72d3f727 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From ad8967de36e6e2a185b71ce1d701448cda4ef3e2 Mon Sep 17 00:00:00 2001
+From a2d13b8f5dcd1cf476568037c860a25db8b0fcd9 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 38c81f2372..14c45be432 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.47.1


--===============6820203679571483359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (0 cached, 941 parsed). 1929 targets, 50 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-64 sysroot...done.
Removing 105 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6bf7078c132667d0cd1066363d6ce0938c233071"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6bf7078c132667d0cd1066363d6ce0938c233071"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 772 Local 744 Mirrors 0 Missed 28 Current 413 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 414 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 438 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 441 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 454 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 470 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 474 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 478 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 481 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 490 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 492 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 493 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 507 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 512 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 514 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 526 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package_qa_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 539 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 549 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 557 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 560 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 561 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.28.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 572 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 589 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 590 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 593 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 602 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 636 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.28.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 638 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 642 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 658 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 671 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 758 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 768 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 770 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 789 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 792 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 802 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1393 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_fetch)
NOTE: Running task 1497 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_write_config)
NOTE: Running task 1510 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_recipe_qa)
NOTE: recipe libinput-1.28.1-r0: task do_fetch: Started
NOTE: Running task 1578 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_write_config)
NOTE: Running task 1581 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_fetch)
NOTE: recipe libinput-1.28.1-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.28.1-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_write_config: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_unpack)
NOTE: Running task 1654 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_recipe_qa unihash changed to 2aeadfcecfcb7dd3fcc88495f7a0603e21bff0157feb3db84e2716f63b8f9193
NOTE: recipe libinput-1.28.1-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Started
NOTE: Running task 1695 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_fetch)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1697 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_unpack: Started
NOTE: recipe libinput-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1701 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_patch)
NOTE: recipe libinput-1.28.1-r0: task do_patch: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 805 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_patch: Started
NOTE: Running setscene task 806 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.28.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 820 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_patch: Succeeded
NOTE: Running setscene task 823 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 837 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 852 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 855 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 866 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1751 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 883 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 884 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 885 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1791 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 890 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 897 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_deploy_source_date_epoch unihash changed to b997ae8e91875e953d7e20f5b93b53d4df9a6bcb75d43370253200d150285fed
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 892 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 898 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_populate_lic: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_populate_lic unihash changed to 72ada016c7095e5408f81d8497fcde68830adf25465a224f4a32369a22772e5e
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 912 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 916 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 918 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 925 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 928 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 930 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 938 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 949 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 950 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 965 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 977 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 979 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 980 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 991 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 993 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 999 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1001 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1024 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1028 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-20.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe clang-20.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1045 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1058 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1060 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1063 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1067 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1068 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1069 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1070 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1074 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1077 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1083 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1088 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1091 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1095 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1099 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1102 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1105 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1109 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1110 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1117 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1120 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1126 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1127 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1133 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1135 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1140 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1141 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1144 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1145 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1148 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1150 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1153 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1159 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1160 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1161 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1163 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1166 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1171 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1172 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1176 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1178 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1184 of 1185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2843 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2980 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3143 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3148 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_collect_spdx_deps)
NOTE: Running task 3177 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_write_ipk)
NOTE: Running task 3178 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_write_deb)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.28.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3179 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_write_rpm)
NOTE: Running task 3180 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_qa)
NOTE: recipe mesa-2_25.1.4-r0: task do_package_write_ipk: Started
NOTE: recipe libinput-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_package_write_deb: Started
NOTE: Running task 3181 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_configure)
NOTE: recipe mesa-2_25.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_qa: Started
NOTE: recipe libinput-1.28.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3182 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_configure: Started
NOTE: recipe libinput-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3183 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.28.1-r0: task do_configure_ptest_base: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_qa unihash changed to 0f3a33bb5ff30ca03407a4774a0b27c7ff4e2079e1e4803d24717ebb81b5f30e
NOTE: recipe libinput-1.28.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3184 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_compile)
NOTE: recipe libinput-1.28.1-r0: task do_compile: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_configure: Succeeded
NOTE: Running task 3185 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_compile: Started
NOTE: recipe libinput-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.28.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3187 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_install)
NOTE: recipe libinput-1.28.1-r0: task do_install: Started
NOTE: recipe libinput-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.28.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.28.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3189 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_package)
NOTE: Running task 3190 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.28.1-r0: task do_package: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.28.1-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_packagedata)
NOTE: recipe libinput-1.28.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_compile: Succeeded
NOTE: Running task 3192 of 3216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_install: Started
NOTE: recipe libinput-1.28.1-r0: task do_packagedata: Failed
NOTE: recipe xserver-xorg-2_21.1.18-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 3192 tasks of which 3158 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715141740.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715141740.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libinput/1.28.1/temp/log.do_packagedata.2929605
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.28.901-r0 to 0:1.28.1-r0) [version-going-backwards]
ERROR: libinput-1.28.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libinput/1.28.1/temp/log.do_packagedata.2929605
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.28.1.bb:do_packagedata) failed with exit code '1'

--===============6820203679571483359==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.16-21.1.18.patch"

RnJvbSBhNTBiNjYyNjQzODA5YjFiZTYwYTA3OTc2NjI1YWEwNzFjYzQyMDFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6MTg6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4xNiAtPiAyMS4xLjE4CgotLS0KIC4uLi8wMDAxLUF2
b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoICAgICAgICB8IDIg
Ky0KIC4uLjEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFy
ZHdhci5wYXRjaCB8IDIgKy0KIC4uLi97eHNlcnZlci14b3JnXzIxLjEuMTYuYmIgPT4geHNlcnZl
ci14b3JnXzIxLjEuMTguYmJ9ICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjE2LmJiID0+IHhzZXJ2ZXIteG9yZ18yMS4x
LjE4LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlP
UG9ydEJhc2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2
ZXIteG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBh
dGNoCmluZGV4IGU5Y2JjOWI0ZGEuLmIzNzBmODFmZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRl
LWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5p
dGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2VkYzc5N2Ux
YTA4NTAwMzlhMjViN2UzODdiMzQyZTU0ZmZmY2M5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMjVkYTRlMzU0YTVjODc2Y2QwNzQ3MjI4Yzg0ZWM1YzM3ZDg3NTg5NyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRl
OiBNb24sIDE3IEF1ZyAyMDIwIDEwOjUwOjUxIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEF2b2lk
IGR1cGxpY2F0ZSBkZWZpbml0aW9ucyBvZiBJT1BvcnRCYXNlCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMu
Yy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMu
Yy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKaW5kZXggYTE5
NmU1MDc1MS4uMmY3MmQzZjcyNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1v
bmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1k
ZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YWQ4OTY3ZGUzNmU2ZTJhMTg1YjcxY2UxZDcwMTQ0OGNkYTRlZjNlMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYTJkMTNiOGY1ZGNkMWNmNDc2NTY4MDM3Yzg2MGEyNWRiOGIwZmNkOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENhbGlmb3JuaWEgU3VsbGl2YW4gPGNhbGlm
b3JuaWEubC5zdWxsaXZhbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDE2IE1hciAyMDE4IDE3OjIz
OjExIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHhmODZwY2lCdXMuYzogdXNlIEludGVsIGRkeCBv
bmx5IGZvciBwcmUtZ2VuNCBoYXJkd2FyZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4xNi5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTguYmIKc2ltaWxhcml0eSBp
bmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94
c2VydmVyLXhvcmdfMjEuMS4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4xOC5iYgppbmRleCAzOGM4MWYyMzcyLi4xNGM0
NWJlNDMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZ18yMS4xLjE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTguYmIKQEAgLTMsNyArMyw3IEBAIHJlcXVpcmUgeHNl
cnZlci14b3JnLmluYwogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1J
bnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNo
IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIxNGExMTZkMmQ4MDVkZWJj
NWI1YjJhYWM1MDVhMjc5ZTY5YjIxN2RhZTJmYWUyZGZjYjYyNDAwNDcxYTk5NzAiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYzg3OGQxOTMwZDg3NzI1ZDRhNWJmNDk4YzI0ZjRiZTgxMzBkNWIyNjQ2
YTlmZDBmMjk5NGRlZmY5MDExNjM1MiIKIAogIyBUaGVzZSBleHRlbnNpb25zIGFyZSBub3cgaW50
ZWdyYXRlZCBpbnRvIHRoZSBzZXJ2ZXIsIHNvIGRlY2xhcmUgdGhlIG1pZ3JhdGlvbgogIyBwYXRo
IGZvciBpbi1wbGFjZSB1cGdyYWRlcy4KLS0gCjIuNDcuMQoK

--===============6820203679571483359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.16.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.18.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-64-poky-linux/xserver-xorg: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18221544 to 18224312 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1154495 to 1154545 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 132633 to 132323 (-0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.16 [default] to 21.1.18 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.16" to "21.1.18"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2810946 to 2815042 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.16 [default] to 21.1.18 [default]

--===============6820203679571483359==--

