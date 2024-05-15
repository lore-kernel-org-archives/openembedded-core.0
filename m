Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D882C27C6F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1263.1715794339704307619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FbraezzX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=phrlXFmN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe54a-c54b3fe7-d566-47ea-8d24-c8941bf405f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kx+Wzua8eROHNab82y20DYHk4KHYSSRSghMm2AqqSZg=;
	b=FbraezzXMwI55S2SFxsN6XXaYS9KlY3PPzSAHOz7hn8uXNqSyi2YijzAZXxRRNYL
	NXliC+DtlAGSpv1FOzUXES15a/6oOEVsyTnEO25E1yRTgrluuJq5EaUhLcA723diL56
	UWvP6jZ93ZsWBA1MsZ6WiwIQAte1QkUww9bpqOGc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kx+Wzua8eROHNab82y20DYHk4KHYSSRSghMm2AqqSZg=;
	b=phrlXFmN/HOPN7M1HuDcfXESsp1y6s5/jvRX9CuyDmaKZvtGKgA45GfqhrV2cuOu
	6zk+c6juGbwzCHzs60Uel40pIekLiSUwGZFS5RswpJsO9T/Hmm/kRN02ckmIaduz+ch
	VROkMWaKDDdWrqdmoPecTdQQ4x8RY+X1PDQurAf8=
Content-Type: multipart/mixed; boundary="===============0037172288637770716=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.1 SUCCEEDED
Message-ID: <0101018f7d4fe54a-c54b3fe7-d566-47ea-8d24-c8941bf405f3-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199370

--===============0037172288637770716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *13.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.0-13.0.1.patch
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
From 8025751250c6db1d5b47259a10d3900a09683b76 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 14:44:57 +0000
Subject: [PATCH] weston: upgrade 13.0.0 -> 13.0.1

---
 ...tools-Include-libgen.h-for-basename-signat.patch | 13 +++++--------
 .../wayland/{weston_13.0.0.bb => weston_13.0.1.bb}  |  2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.0.bb => weston_13.0.1.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index 1d281fa832..e17891034b 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From 2b53236ac637dfa7fb0f438f7391a73f6ef92a06 Mon Sep 17 00:00:00 2001
+From 9750cb7a68013fd6ce00f426bfd435107052471b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-drm/libbacklight.c
-index ca7f2d68..74690fa7 100644
+index ca7f2d6..74690fa 100644
 --- a/libweston/backend-drm/libbacklight.c
 +++ b/libweston/backend-drm/libbacklight.c
 @@ -41,6 +41,7 @@
@@ -30,19 +30,16 @@ index ca7f2d68..74690fa7 100644
 +#include <libgen.h>
  #include <string.h>
  #include <errno.h>
-
+ 
 diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_impl.c
-index 18f03015..9b460fa0 100644
+index 18f0301..9b460fa 100644
 --- a/tools/zunitc/src/zunitc_impl.c
 +++ b/tools/zunitc/src/zunitc_impl.c
 @@ -27,6 +27,7 @@
-
+ 
  #include <errno.h>
  #include <fcntl.h>
 +#include <libgen.h>
  #include <stdarg.h>
  #include <stdbool.h>
  #include <stdio.h>
---
-2.43.0
-
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipes-graphics/wayland/weston_13.0.1.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.0.bb
rename to meta/recipes-graphics/wayland/weston_13.0.1.bb
index cb0024c5ca..eae13e1c21 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
+SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============0037172288637770716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 103 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c634be58c98053e27339fab4505f971588e48bbf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c634be58c98053e27339fab4505f971588e48bbf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 782 Local 724 Mirrors 0 Missed 58 Current 336 (92% match, 94% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 342 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 343 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 344 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 356 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 383 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 384 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 389 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 410 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 418 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 421 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 434 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 437 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_recipe_qa_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 451 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 452 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 457 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 459 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 464 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 468 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 478 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 480 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 485 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe weston-13.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 487 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 488 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 489 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 492 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 493 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 494 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 496 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 499 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 509 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 510 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 518 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 525 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 528 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 536 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 537 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 561 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 565 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 572 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 574 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 579 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_create_spdx_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 596 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 600 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 621 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 623 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 627 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 629 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 640 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 642 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 649 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 653 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 658 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 660 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 662 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 663 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 668 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 672 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-23.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 675 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 677 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe xwayland-23.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 684 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 686 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 688 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 691 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 695 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-23.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 696 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 698 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 704 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-23.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe icu-74-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe icu-74-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 713 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 714 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 716 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 717 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe icu-74-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe icu-74-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 874 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 883 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 896 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 904 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 907 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 913 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 919 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 930 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 933 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 935 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 939 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1000 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_fetch)
NOTE: Running task 1001 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1011 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_fetch)
NOTE: Running task 1012 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_fetch)
NOTE: Running task 1013 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1031 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.4.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_fetch: Started
NOTE: Running task 1167 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_fetch: Started
NOTE: Running setscene task 942 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 944 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1194 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_unpack)
NOTE: Running task 1195 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_unpack)
NOTE: recipe pango-1.52.2-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_unpack)
NOTE: Running task 1231 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_write_config)
NOTE: Running task 1236 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_write_config)
NOTE: Running task 1237 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_write_config)
NOTE: Running task 1238 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_write_config)
NOTE: Running task 1249 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe mesa-2_24.0.5-r0: task do_fetch: Started
NOTE: Running task 1277 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: Running task 1279 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_unpack)
NOTE: Running task 1299 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.4.0-r0: task do_write_config: Started
NOTE: recipe pango-1.52.2-r0: task do_unpack: Started
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1300 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_unpack)
NOTE: recipe pango-1.52.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_write_config: Started
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 946 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.52.2-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe mesa-2_24.0.5-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_write_config: Succeeded
NOTE: Running task 1322 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb:do_fetch)
NOTE: Running task 1325 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1354 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1372 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1378 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_fetch)
NOTE: recipe mesa-2_24.0.5-r0: task do_write_config: Succeeded
NOTE: Running task 1379 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb:do_write_config)
NOTE: Running task 1388 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe xwayland-23.2.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1389 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe weston-13.0.1-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_write_config)
NOTE: Running task 1425 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 950 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1426 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe weston-13.0.1-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.2.6-r0: task do_write_config: Started
NOTE: Running task 1427 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 953 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running setscene task 954 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe pango-1.52.2-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-23.2.6-r0: task do_write_config: Succeeded
NOTE: Running setscene task 956 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe xwayland-23.2.6-r0: task do_unpack: Started
NOTE: Running setscene task 957 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 958 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe weston-13.0.1-r0: task do_write_config: Started
NOTE: recipe weston-13.0.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_write_config: Succeeded
NOTE: Running task 1430 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1432 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-23.2.6-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe pango-1.52.2-r0: task do_patch: Started
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1676 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_patch: Succeeded
NOTE: Running task 1793 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb:do_patch)
NOTE: Running task 1796 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1803 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_patch)
NOTE: Running task 1804 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 1823 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1886 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe xwayland-23.2.6-r0: task do_patch: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Started
NOTE: recipe weston-13.0.1-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1899 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe xwayland-23.2.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 988 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 990 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 991 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 992 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 998 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1003 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1007 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1011 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1012 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1017 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1018 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1035 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1037 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1942 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1948 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1951 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1962 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1964 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack)
NOTE: Running task 1965 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_populate_lic)
NOTE: Running setscene task 1044 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.4.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1050 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1053 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-13.0.1-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1058 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_patch)
NOTE: recipe mesa-2_24.0.5-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_patch: Started
NOTE: recipe weston-13.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_populate_lic unihash changed to c7f75e1f821d1142ab7b76e650778ff2b52451225ff3889e3a7a6e26271d53a7
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_deploy_source_date_epoch unihash changed to d84d3d02033cce5b9bbaa09ede646ed8d1916838914cb7a323c818e0e496aeca
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1057 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1059 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1077 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2051 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046af30f485647cdc4daf97991a290103f143d7d3bc201e5aa9bffcd6d2b5b32
NOTE: Running task 2077 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2583 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2584 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2608 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2609 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2621 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2816 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2874 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_collect_spdx_deps)
NOTE: Running task 2894 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2921 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 2922 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: Running task 2932 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2933 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_collect_spdx_deps)
NOTE: Running task 2940 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2947 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2948 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_configure)
NOTE: Running task 2949 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure)
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_configure: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2950 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2951 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 2952 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.4.0-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2953 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2954 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2955 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2956 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2957 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2959 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile)
NOTE: recipe libinput-1.25.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_configure: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2960 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_configure_ptest_base)
NOTE: Running task 2961 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_configure_ptest_base: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2962 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata unihash changed to d15f1de3bff845fa07fd3cba849f7e38a14b568e6db148814b2e02435c92242e
NOTE: Setscene tasks completed
NOTE: Running task 2963 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-8.4.0-r0: task do_configure: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2964 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb:do_compile)
NOTE: recipe harfbuzz-8.4.0-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile: Succeeded
NOTE: Running task 2965 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2966 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install)
NOTE: recipe libinput-1.25.0-r0: task do_install: Started
NOTE: recipe libinput-1.25.0-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2968 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_package)
NOTE: Running task 2969 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2970 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_compile)
NOTE: recipe mesa-2_24.0.5-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_compile: Succeeded
NOTE: Running task 2973 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2974 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 2975 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 2976 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_package: Succeeded
NOTE: Running task 2977 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata)
NOTE: recipe kbd-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 2978 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.6.4-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata unihash changed to 98f814b70a1727c491e041b018133c078ca98edf435bd69004c277f537c3aebc
NOTE: Setscene tasks completed
NOTE: Running task 2979 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_install: Succeeded
NOTE: Running task 2980 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_install_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2981 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_package)
NOTE: Running task 2982 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_package: Started
NOTE: recipe kbd-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_install)
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_install: Started
NOTE: Running task 2984 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 46205a7b7ffca2dc06bfcf7326f4f98ddaffcdf327d30cca57cf0616a31f523d
NOTE: Setscene tasks completed
NOTE: Running task 2985 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 2986 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_package)
NOTE: recipe kbd-2.6.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_package: Succeeded
NOTE: Running task 2987 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_packagedata: Started
NOTE: recipe kbd-2.6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_package unihash changed to bac4cbf1100759be8b8b3f59f5dc5c3ba76c267ee79db6a19cfcf19f2fc74f58
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 1118 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.11-r0: task do_packagedata: Failed
NOTE: recipe harfbuzz-8.4.0-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2988 tasks of which 2880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515144224.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515144224.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_packagedata
Summary: There were 119 ERROR messages, returning a non-zero exit code.
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-xlib went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kab went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.42.12-r0 to 0:2.42.11-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gdk-pixbuf/2.42.11/temp/log.do_packagedata.2543213
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb:do_packagedata) failed with exit code '1'

--===============0037172288637770716==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.0-13.0.1.patch"

RnJvbSA4MDI1NzUxMjUwYzZkYjFkNWI0NzI1OWExMGQzOTAwYTA5NjgzYjc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTQ6NDQ6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTMuMC4wIC0+IDEzLjAuMQoKLS0tCiAuLi50b29scy1JbmNsdWRlLWxp
Ymdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggfCAxMyArKysrKy0tLS0tLS0tCiAuLi4v
d2F5bGFuZC97d2VzdG9uXzEzLjAuMC5iYiA9PiB3ZXN0b25fMTMuMC4xLmJifSAgfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dlc3Rvbl8xMy4wLjAuYmIgPT4gd2VzdG9u
XzEzLjAuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFz
ZW5hbWUtc2lnbmF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9u
LzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25h
dC5wYXRjaAppbmRleCAxZDI4MWZhODMyLi5lMTc4OTEwMzRiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVk
ZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdl
bi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJiNTMy
MzZhYzYzN2RmYTdmYjBmNDM4ZjczOTFhNzNmNmVmOTJhMDYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDk3NTBjYjdhNjgwMTNmZDZjZTAwZjQyNmJmZDQzNTEwNzA1MjQ3MWIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgog
RGF0ZTogVGh1LCAxNCBEZWMgMjAyMyAwOToxMzo1NCAtMDgwMAogU3ViamVjdDogW1BBVENIXSBs
aWJ3ZXN0b24sdG9vbHM6IEluY2x1ZGUgbGliZ2VuLmggZm9yIGJhc2VuYW1lIHNpZ25hdHVyZQpA
QCAtMjAsNyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9s
aWJ3ZXN0b24vYmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMgYi9saWJ3ZXN0b24vYmFja2VuZC1k
cm0vbGliYmFja2xpZ2h0LmMKLWluZGV4IGNhN2YyZDY4Li43NDY5MGZhNyAxMDA2NDQKK2luZGV4
IGNhN2YyZDYuLjc0NjkwZmEgMTAwNjQ0CiAtLS0gYS9saWJ3ZXN0b24vYmFja2VuZC1kcm0vbGli
YmFja2xpZ2h0LmMKICsrKyBiL2xpYndlc3Rvbi9iYWNrZW5kLWRybS9saWJiYWNrbGlnaHQuYwog
QEAgLTQxLDYgKzQxLDcgQEAKQEAgLTMwLDE5ICszMCwxNiBAQCBpbmRleCBjYTdmMmQ2OC4uNzQ2
OTBmYTcgMTAwNjQ0CiArI2luY2x1ZGUgPGxpYmdlbi5oPgogICNpbmNsdWRlIDxzdHJpbmcuaD4K
ICAjaW5jbHVkZSA8ZXJybm8uaD4KLQorIAogZGlmZiAtLWdpdCBhL3Rvb2xzL3p1bml0Yy9zcmMv
enVuaXRjX2ltcGwuYyBiL3Rvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwuYwotaW5kZXggMThm
MDMwMTUuLjliNDYwZmEwIDEwMDY0NAoraW5kZXggMThmMDMwMS4uOWI0NjBmYSAxMDA2NDQKIC0t
LSBhL3Rvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwuYwogKysrIGIvdG9vbHMvenVuaXRjL3Ny
Yy96dW5pdGNfaW1wbC5jCiBAQCAtMjcsNiArMjcsNyBAQAotCisgCiAgI2luY2x1ZGUgPGVycm5v
Lmg+CiAgI2luY2x1ZGUgPGZjbnRsLmg+CiArI2luY2x1ZGUgPGxpYmdlbi5oPgogICNpbmNsdWRl
IDxzdGRhcmcuaD4KICAjaW5jbHVkZSA8c3RkYm9vbC5oPgogICNpbmNsdWRlIDxzdGRpby5oPgot
LS0KLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
ZXN0b25fMTMuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEz
LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4xLmJiCmluZGV4IGNiMDAyNGM1Y2EuLmVhZTEzZTFj
MjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMy4w
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMS5i
YgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy93YXlsYW5kL3dlc3Rvbi8tL3JlbGVhc2VzLyR7UFZ9L2Rvd25sbwogICAgICAgICAgICBm
aWxlOi8vc3lzdGVtZC1ub3RpZnkud2VzdG9uLXN0YXJ0IFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNTJmZjFkNGFhMjM5NGEyZTQxNmM4NWEzMzhiNjI3Y2U5N2ZhNzFk
NDNlYjc2MmZkNGFhZjE0NWQzNmZjNzk1YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlYTE1NjZh
YjRmNWZmY2U3ZTlmZDRmN2ExZmNhNWIzMGNhYWU0ZDUwMDIzYmY0NTkyMTM5OTQwOTRlMDJiMjlh
IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3dheWxhbmQvd2VzdG9uLy0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
Lyg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCi0tIAoyLjQ0LjAKCg==

--===============0037172288637770716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/weston: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.0/downloads/weston-13.0.0.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.1/downloads/weston-13.0.1.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.0", added "/usr/lib/libweston-13.so.0.0.1"
packages/core2-64-poky-linux/weston/libweston-13: PKGSIZE changed from 857781 to 861877 (+0%)
packages/core2-64-poky-linux/weston/libweston-13: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/libweston-13: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.0 to libweston-13.so.0.0.1
  /usr/lib/libweston-13.so.0.0.0 moved to /usr/lib/libweston-13.so.0.0.1
packages/core2-64-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-13.so.0.0.0", added "/usr/lib/.debug/libweston-13.so.0.0.1"
packages/core2-64-poky-linux/weston/weston-dbg: PKGSIZE changed from 15976512 to 15977736 (+0%)
packages/core2-64-poky-linux/weston/weston-dbg: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-dbg: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-dev: PKGSIZE changed from 160781 to 160754 (-0%)
packages/core2-64-poky-linux/weston/weston-dev: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-dev: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-doc: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-doc: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-examples: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-examples: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-locale: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-locale: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-src: PKGSIZE changed from 5034527 to 5036746 (+0%)
packages/core2-64-poky-linux/weston/weston-src: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-src: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-staticdev: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-staticdev: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-xwayland: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-xwayland: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston: PKGV changed from 13.0.0 [default] to 13.0.1 [default]

--===============0037172288637770716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.0", added "/usr/lib/libweston-13.so.0.0.1"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.0 to libweston-13.so.0.0.1
  /usr/lib/libweston-13.so.0.0.0 moved to /usr/lib/libweston-13.so.0.0.1

--===============0037172288637770716==--

