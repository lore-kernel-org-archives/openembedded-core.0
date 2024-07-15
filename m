Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E8C52D76
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1375.1721071147900558110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Vwx/ED+k;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mNuSaqEJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d59bf3-1e2c91e1-cacb-4025-a0b5-64cec0430ee3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tw0ECuGYTCF3Iw4/2t0dFAvCnG8/wnYkIVL675DVaac=;
	b=Vwx/ED+kEB/D/x6jL68WmgGkzd3GyXqqj/nsabGj6kD2DswiUfLrgbBQ0AbeP4zI
	f/IYmUL9kiuaMVTxJkp53yjRtb8j2F6cE31Q0qrKH0c1zmhjJfg3Hgk6rdvebKLDCvV
	Ozp3HcoOGdY0DWWO9midlxnuIwBbTjFml3YeaHnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tw0ECuGYTCF3Iw4/2t0dFAvCnG8/wnYkIVL675DVaac=;
	b=mNuSaqEJtKbFaRjAx0GTyMbKYi6A+CPb3N+Mmdc5nfXVft10PUeSaBDMjyaVKQwf
	P96j51F5F078fxy71EGW8o/0q4TaVM+RXxWcQ4rHF+x1H6rN5W2XRRTM36ALFVA8PAL
	C8ZA/htbYPd7WzuNzW1+zf1545RUMsLs4rSVuB/U=
Content-Type: multipart/mixed; boundary="===============0977682093534775197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.3 SUCCEEDED
Message-ID: <01010190b7d59bf3-1e2c91e1-cacb-4025-a0b5-64cec0430ee3-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202032

--===============0977682093534775197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *13.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.1-13.0.3.patch
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
From c0b890323580642eb99e7b83c1ae86bf715a00fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 15:38:28 +0000
Subject: [PATCH] weston: upgrade 13.0.1 -> 13.0.3

---
 ...1-libweston-tools-Include-libgen.h-for-basename-signat.patch | 2 +-
 .../wayland/{weston_13.0.1.bb => weston_13.0.3.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.1.bb => weston_13.0.3.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index fbec9f9d4e..a250aa67d3 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
+From 690f9c610fff10d23d535197eeaa743552a24364 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.1.bb
rename to meta/recipes-graphics/wayland/weston_13.0.3.bb
index eae13e1c21..e4843d38f7 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
+SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============0977682093534775197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3

--===============0977682093534775197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-64 sysroot...done.
Removing 142 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-15c83b0982fbcdd78b8b84e4fbad746c9a95ba80"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:15c83b0982fbcdd78b8b84e4fbad746c9a95ba80"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 755 Local 720 Mirrors 0 Missed 35 Current 363 (95% match, 96% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 368 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 369 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 370 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 401 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 405 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 406 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.52.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 420 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 427 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 436 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 440 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 441 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 445 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 451 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.26.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 464 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 466 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 469 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_recipe_qa_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 477 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 482 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 484 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe libinput-1.26.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 493 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 496 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/harfbuzz/8.5.0/temp/log.do_packagedata_setscene.579508
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 507 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_package_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 530 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 542 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 562 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 563 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 570 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 574 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 593 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 603 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 609 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 610 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 612 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 620 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 635 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 644 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 666 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 668 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 670 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 671 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 679 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 699 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 701 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 711 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 719 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 854 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 887 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 892 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 905 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 919 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 984 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 927 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1216 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_write_config)
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1294 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1320 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_fetch)
NOTE: recipe libinput-1.26.1-r0: task do_write_config: Started
NOTE: recipe libinput-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_recipe_qa)
NOTE: Running task 1375 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_write_config)
NOTE: Running task 1384 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_unpack)
NOTE: Running task 1385 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1420 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1421 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe xwayland-24.1.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 952 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 954 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_recipe_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: Running setscene task 955 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.26.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1443 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_unpack)
NOTE: Running task 1444 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe xwayland-24.1.0-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe weston-13.0.3-r0: task do_write_config: Started
NOTE: Running task 1461 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1463 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_unpack: Started
NOTE: Running task 1498 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1507 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 1508 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1509 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1521 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: Running setscene task 968 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Started
NOTE: recipe xwayland-24.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1523 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_fetch: Started
NOTE: recipe weston-13.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1524 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libinput-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 1526 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 974 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1533 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xwayland-24.1.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libinput-1.26.1-r0: task do_patch: Started
NOTE: Running task 1540 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libinput-1.26.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe kbd-2.6.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe weston-13.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_patch)
NOTE: recipe kbd-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 991 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 994 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 996 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1003 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1008 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1015 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1017 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1020 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1025 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1030 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1035 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1051 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1059 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1963 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1964 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2001 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_populate_lic)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe weston-13.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_populate_lic: Started
NOTE: Running setscene task 1063 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1064 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_populate_lic unihash changed to 0535cc79f3aa426258adfaf57134ef43307fb080408cf9a36f13a1b4a3fe9345
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1077 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running setscene task 1096 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1097 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1099 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2053 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2059 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2617 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2783 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2851 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2863 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata)
NOTE: Running task 2938 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2958 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2980 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Started
NOTE: Running task 2989 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_configure)
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2997 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: Running task 2998 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.6.4-r0: task do_configure: Started
NOTE: recipe libinput-1.26.1-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3004 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_configure)
NOTE: recipe xwayland-24.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libinput-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3010 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_compile)
NOTE: recipe libinput-1.26.1-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3012 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_compile)
NOTE: recipe xwayland-24.1.0-r0: task do_compile: Started
NOTE: recipe libinput-1.26.1-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.26.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.26.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3015 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_install)
NOTE: recipe libinput-1.26.1-r0: task do_install: Started
NOTE: recipe libinput-1.26.1-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.26.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.26.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3017 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_package)
NOTE: Running task 3018 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.26.1-r0: task do_package: Started
NOTE: recipe libinput-1.26.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.26.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 3019 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_compile)
NOTE: recipe kbd-2.6.4-r0: task do_compile: Started
NOTE: recipe libinput-1.26.1-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_packagedata)
NOTE: recipe libinput-1.26.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-24.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3021 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_install)
NOTE: recipe xwayland-24.1.0-r0: task do_install: Started
NOTE: recipe libinput-1.26.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_packagedata unihash changed to de2ba7dab1422a3a0542b496c5bcdd5e8d28409167a1214b6f193fa92bbdd41d
NOTE: Setscene tasks completed
NOTE: Running task 3022 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_create_spdx)
NOTE: recipe libinput-1.26.1-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.0-r0: task do_install: Succeeded
NOTE: Running task 3023 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package)
NOTE: Running task 3024 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_populate_sysroot)
NOTE: recipe xwayland-24.1.0-r0: task do_package: Started
NOTE: recipe libinput-1.26.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe kbd-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_install)
NOTE: recipe xwayland-24.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3026 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.6.4-r0: task do_install: Started
NOTE: recipe weston-13.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-13.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3027 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_configure)
NOTE: recipe weston-13.0.3-r0: task do_configure: Started
NOTE: recipe kbd-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 3028 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_package)
NOTE: recipe kbd-2.6.4-r0: task do_package: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package: Succeeded
NOTE: Running task 3029 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_packagedata)
NOTE: recipe xwayland-24.1.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-24.1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_packagedata unihash changed to 1eb7d4478377d46df52beb656d463e858f9f410aebabd08c657d1b79c3fc116d
NOTE: Setscene tasks completed
NOTE: Running task 3030 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_create_spdx)
NOTE: Running task 3031 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_ipk)
NOTE: Running task 3032 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_deb)
NOTE: Running task 3033 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_rpm)
NOTE: recipe xwayland-24.1.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_deb: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-24.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3034 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_ipk unihash changed to 2c1819661119a7ea2cda5dcd9b46cc1a1d3a21f94ca4b57f01e9a61f9c40ee06
NOTE: recipe weston-13.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-13.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3035 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_compile)
NOTE: recipe weston-13.0.3-r0: task do_compile: Started
NOTE: recipe kbd-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_packagedata)
NOTE: recipe kbd-2.6.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_rpm unihash changed to e4a690d7e530aff7f4cb2ec76e538df616a883d851e99b5a53da6745309e177d
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_deb unihash changed to 88dce0630fbdd2ebea50a03ca865adeff3e16ce6cbe1202012f34b87499a431b
NOTE: recipe weston-13.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_install)
NOTE: recipe weston-13.0.3-r0: task do_install: Started
NOTE: recipe weston-13.0.3-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_package)
NOTE: Running task 3039 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_populate_sysroot)
NOTE: recipe weston-13.0.3-r0: task do_package: Started
NOTE: recipe weston-13.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe weston-13.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_packagedata)
NOTE: recipe weston-13.0.3-r0: task do_packagedata: Started
NOTE: recipe weston-13.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3041 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_create_spdx)
NOTE: Running task 3042 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_ipk)
NOTE: Running task 3043 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_deb)
NOTE: Running task 3044 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_rpm)
NOTE: recipe weston-13.0.3-r0: task do_create_spdx: Started
NOTE: Running task 3045 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_package_write_ipk)
NOTE: recipe weston-init-1.0-r0: task do_package_write_ipk: Started
NOTE: Running task 3046 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_package_write_deb)
NOTE: recipe weston-init-1.0-r0: task do_package_write_deb: Started
NOTE: Running task 3047 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_package_write_rpm)
NOTE: recipe weston-init-1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 3048 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_package_qa)
NOTE: recipe weston-13.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe weston-13.0.3-r0: task do_package_write_deb: Started
NOTE: recipe weston-13.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe weston-13.0.3-r0: task do_package_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3049 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_create_runtime_spdx)
NOTE: recipe weston-13.0.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe weston-13.0.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_package_qa: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3050 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3050 tasks of which 2960 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0977682093534775197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.1/downloads/weston-13.0.1.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.3/downloads/weston-13.0.3.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-64-poky-linux/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/libweston-13: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/libweston-13: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3
packages/core2-64-poky-linux/weston/weston-dbg: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-13.so.0.0.1", added "/usr/lib/.debug/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-dev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-doc: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-doc: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-examples: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-examples: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-locale: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-locale: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-src: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-src: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-staticdev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-staticdev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-xwayland: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-xwayland: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]

--===============0977682093534775197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.1-13.0.3.patch"

RnJvbSBjMGI4OTAzMjM1ODA2NDJlYjk5ZTdiODNjMWFlODZiZjcxNWEwMGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTU6Mzg6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTMuMC4xIC0+IDEzLjAuMwoKLS0tCiAuLi4xLWxpYndlc3Rvbi10b29s
cy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggfCAyICstCiAuLi4v
d2F5bGFuZC97d2VzdG9uXzEzLjAuMS5iYiA9PiB3ZXN0b25fMTMuMC4zLmJifSAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzEzLjAuMS5i
YiA9PiB3ZXN0b25fMTMuMC4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdl
bi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFz
ZW5hbWUtc2lnbmF0LnBhdGNoCmluZGV4IGZiZWM5ZjlkNGUuLmEyNTBhYTY3ZDMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10
b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUlu
Y2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gZTA1MDgzMDg5OGVhMzdkMzBlZjFjNTMzOWNiMTY2NWJkYjkyZGNkYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjkwZjljNjEwZmZmMTBkMjNkNTM1MTk3ZWVhYTc0MzU1MmEy
NDM2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBUaHUsIDE0IERlYyAyMDIzIDA5OjEzOjU0IC0wODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGxpYndlc3Rvbix0b29sczogSW5jbHVkZSBsaWJnZW4uaCBmb3IgYmFzZW5hbWUg
c2lnbmF0dXJlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0
b25fMTMuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4zLmJiCmluZGV4IGVhZTEzZTFjMjEuLmU0ODQzZDM4Zjcg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMy5iYgpA
QCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy93YXlsYW5kL3dlc3Rvbi8tL3JlbGVhc2VzLyR7UFZ9L2Rvd25sbwogICAgICAgICAgICBmaWxl
Oi8vc3lzdGVtZC1ub3RpZnkud2VzdG9uLXN0YXJ0IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZWExNTY2YWI0ZjVmZmNlN2U5ZmQ0ZjdhMWZjYTViMzBjYWFlNGQ1MDAy
M2JmNDU5MjEzOTk0MDk0ZTAyYjI5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2Y2OGQ5NmUz
Yjk3ZDk4ZGFhZGVmMTNhMjAyMzU2NTI0OTI0ZmEzODE0MThmYTY3MTZiOTEzNmVmMDk5MDkzIgog
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2VzdG9uLy0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/
UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCi0tIAoyLjQ0LjAKCg==

--===============0977682093534775197==--

