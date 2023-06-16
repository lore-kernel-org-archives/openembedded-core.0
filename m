Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B86C3DA41
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.837.1686887484828430222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XfyOE2vW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c2544a82-676ebb8c-c9ae-4f48-9255-ff64b1fc037d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gdQEsNPU/Mvgdnm1gOZ0r2dVcDqzpfNXZE9QGc+XY+s=;
	b=XfyOE2vWvCMY5MHcLgu9+yn3P0ZwXBP5KB1CMg9yHn0Iz7SCQcgB9ui7M2DLUk85
	GYVT9RMcG4FL0n+1Z80eaRWlu/v2Zz10kfQ5mkaLZ21S/+fRq2zmuJ01kLiHzfH/RD3
	IMl6MUVw80VxT3XvGyhEP5xaheRbB9Rw2NAE6vNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gdQEsNPU/Mvgdnm1gOZ0r2dVcDqzpfNXZE9QGc+XY+s=;
	b=g91SWpOVxn1yDEkfVGW1Pohvbd6zQU0NQzg1A7/d4PLbv94bE6Ycw+gmtV3vAE5f
	d5C3j8NkwdyW5l1+rXteUAgPxAQoCFhu+6gjoiVpBQTX9lTXwut5xMF/W8oRTYrbX/J
	gE/DeIXnc6S8UyAWTJMoWajaKxokuiCf3rzU1xmU=
Content-Type: multipart/mixed; boundary="===============1767135431344165437=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.10.4 SUCCEEDED
Message-ID: <01010188c2544a82-676ebb8c-c9ae-4f48-9255-ff64b1fc037d-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182971

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.10.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.10.3-4.10.4.patch
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
From f19024a97a2fa02e7baabccc93f26c6c0ab2f76f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 19:50:10 +0000
Subject: [PATCH] gtk4: upgrade 4.10.3 -> 4.10.4

---
 meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb => gtk4_4.10.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb => gtk4_4.10.4.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
index 9aa33e6851..2d1e0e74a9 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4545441ad79e377eb6e0a705026dc7a46886e46a1b034db40912909da801cea9"
+SRC_URI[sha256sum] = "7725400482e0685e28265e226c62847f4e73cfca9e9b416ac5838207f5377a24"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.39.2


--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:27db9f18935cb0bf20f04bd6fdf3a846b363acbc"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 194 Local 50 Mirrors 0 Missed 144 Current 905 (25% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 932 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 949 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 961 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 976 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1070 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1089 of 1099 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1090 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1091 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1092 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1094 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.6-r0/temp/log.do_packagedata_setscene.3994640
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gobject-introspection/1.74.0-r0/temp/log.do_packagedata_setscene.3994717
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1095 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1099 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_setscene)
NOTE: Running setscene task 1097 of 1099 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1972 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_fetch)
NOTE: Running task 1973 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: Running task 2114 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_write_config)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Started
NOTE: Running task 2135 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2136 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2210 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Started
NOTE: Running task 2241 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 2284 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2285 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2312 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: Running task 2313 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2346 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2347 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2349 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2350 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2353 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2385 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2386 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2387 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2388 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2403 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: Running task 2443 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: Running task 2452 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2454 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2459 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2460 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2461 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2462 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_fetch)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2485 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2494 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2500 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 2501 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2508 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 2511 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2524 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2527 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2528 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_fetch)
NOTE: Running task 2529 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2530 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2531 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2552 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2553 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2564 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2565 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2589 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 2593 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: Running task 2597 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: Running task 2600 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 2601 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2602 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2603 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2605 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: Running task 2606 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2607 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2608 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2618 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2626 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2627 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2630 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2631 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2632 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2633 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_unpack)
NOTE: Running task 2634 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2671 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: Running task 2684 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2685 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_unpack)
NOTE: Running task 2686 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2689 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2693 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2708 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2714 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Started
NOTE: Running task 2725 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 2741 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2742 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Started
NOTE: Running task 2743 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Started
NOTE: Running task 2744 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_write_config)
NOTE: Running task 2750 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: Running task 2752 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 2777 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2778 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2779 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2780 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2795 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2820 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2821 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_write_config)
NOTE: Running task 2822 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2823 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2824 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2825 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2826 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2827 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2828 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2829 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2843 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2844 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2845 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2846 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_unpack)
NOTE: Running task 2851 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2852 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2857 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2858 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2859 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2860 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 2861 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2862 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: Running task 2889 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Started
NOTE: Running task 2890 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2891 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: Running task 2936 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2967 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 2978 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2980 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3009 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: Running task 3010 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 3027 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_write_config)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3030 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3031 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3032 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: Running task 3033 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3034 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3035 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3036 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3102 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3113 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3114 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: Running task 3127 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3128 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 3129 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 3130 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3131 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3157 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 3158 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 3159 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3160 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3161 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3162 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 3163 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3164 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3166 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: Running task 3168 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3171 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3181 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3182 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx)
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 3183 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: Running task 3184 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 3185 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 3199 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3200 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3201 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3202 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3203 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Started
NOTE: Running task 3210 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3223 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3224 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3225 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3226 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3227 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3228 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: Running task 3240 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: Running task 3241 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3242 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3243 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3244 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 3245 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: Running task 3246 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3247 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3266 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: Running task 3268 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3269 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3306 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3307 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3308 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3311 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3313 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3314 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3315 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3316 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 3317 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3318 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3319 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Succeeded
NOTE: Running task 3320 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3321 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3322 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic unihash changed to 459201ab9f27743b20a0928121bb8cd3b90fe09fd5ca2eb9707d1451b34fa0e4
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3323 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3324 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3325 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3326 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3327 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3328 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3329 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 3330 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 3331 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3332 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3333 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3334 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3335 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3336 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3337 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3338 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3339 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3340 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3341 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3342 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3343 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3344 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3345 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3346 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3347 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: Running task 3348 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3349 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3350 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3351 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3352 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3353 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3354 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3355 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: Running task 3356 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: Running task 3357 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3358 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3359 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3360 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3361 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3362 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package_write_rpm)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3363 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3364 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3365 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3366 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3367 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3368 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: Running task 3369 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: Running task 3370 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3371 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3372 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: Running task 3373 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3374 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3375 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3376 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3377 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3382 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3383 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3384 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3385 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3386 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3387 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3388 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3389 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3390 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3391 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3392 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3393 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3394 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: Running task 3395 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3396 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3397 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3398 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_collect_spdx_deps)
NOTE: Running task 3399 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3400 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3401 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3402 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 3403 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 3404 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3405 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3406 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3407 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3408 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: Running task 3409 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3410 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3411 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3412 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3413 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3414 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 3415 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3416 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3417 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3418 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3419 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3420 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3421 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3422 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3423 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3424 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: Running task 3425 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 3426 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: Running task 3427 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3428 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3429 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3430 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3431 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3432 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 3433 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3434 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_create_spdx)
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3435 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3436 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3437 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3438 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3439 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 3440 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 3441 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3442 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3443 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3444 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3445 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3446 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 3447 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3448 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3449 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_create_spdx)
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3450 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3451 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3452 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3453 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3454 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3455 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3456 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3457 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3458 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 3459 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3460 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3461 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3462 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3463 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3464 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3465 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3466 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3467 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3468 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3469 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3470 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3471 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3472 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3473 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3474 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3475 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3476 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 3477 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 3478 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 3479 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3480 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3481 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 3482 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3483 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3484 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3485 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3486 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3487 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_package)
NOTE: Running task 3488 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3489 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3490 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3491 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_compile)
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3492 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3493 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3494 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3495 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_install)
NOTE: recipe gtk4-4.10.4-r0: task do_install: Started
NOTE: recipe gtk4-4.10.4-r0: task do_install: Succeeded
NOTE: Running task 3496 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package)
NOTE: Running task 3497 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_package: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package: Succeeded
NOTE: Running task 3498 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_packagedata)
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3499 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_spdx)
NOTE: Running task 3500 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_write_rpm)
NOTE: Running task 3501 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_qa)
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3502 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3503 of 3503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3503 tasks of which 3143 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1767135431344165437==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.10.3-4.10.4.patch"

RnJvbSBmMTkwMjRhOTdhMmZhMDJlN2JhYWJjY2M5M2YyNmM2YzBhYjJmNzZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTk6NTA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTAuMyAtPiA0LjEwLjQKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xMC4zLmJiID0+IGd0azRfNC4xMC40LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTAuMy5iYiA9PiBndGs0XzQuMTAuNC5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMy5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC4zLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuNC5iYgppbmRleCA5YWEzM2U2ODUxLi4y
ZDFlMGU3NGE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuNC5iYgpAQCAtMzcs
NyArMzcsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI0NTQ1NDQxYWQ3OWUzNzdlYjZlMGE3MDUwMjZkYzdhNDY4ODZlNDZh
MWIwMzRkYjQwOTEyOTA5ZGE4MDFjZWE5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3MjU0MDA0
ODJlMDY4NWUyODI2NWUyMjZjNjI4NDdmNGU3M2NmY2E5ZTliNDE2YWM1ODM4MjA3ZjUzNzdhMjQi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1000.3", added "/usr/lib/.debug/libgtk-4.so.1.1000.4"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 29679404 to 29685532 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dev: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 13861874 to 13862577 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-doc: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 102027 to 102264 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 101193 to 101369 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 116182 to 116373 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGSIZE changed from 103922 to 104101 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGSIZE changed from 101548 to 101722 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGSIZE changed from 96775 to 96951 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGSIZE changed from 100145 to 100319 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGSIZE changed from 122237 to 122465 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 97969 to 98141 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 99027 to 99204 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 121583 to 121773 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGSIZE changed from 94107 to 94274 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 38187186 to 38193206 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.3", added "/usr/lib/libgtk-4.so.1.1000.4"
packages/core2-32-poky-linux/gtk4/gtk4: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4/gtk4: PKGSIZE changed from 13009999 to 13014315 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4: PKGV changed from 4.10.3 [default] to 4.10.4 [default]
packages/core2-32-poky-linux/gtk4: PV changed from "4.10.3" to "4.10.4"
packages/core2-32-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.3.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.4.tar.xz"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.3 to libgtk-4.so.1.1000.4
  /usr/lib/libgtk-4.so.1.1000.3 moved to /usr/lib/libgtk-4.so.1.1000.4
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-13.1.1 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxcomplexintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxfp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxneconvertintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxvnniint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cmpccxaddintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/prfchiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/raointintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/contracts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cp-trait.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-infer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/m2 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/m2/m2-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/make-unique.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opts-jobserver.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-range-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-range-storage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-13.1.1 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxcomplexintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxfp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxneconvertintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxvnniint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cmpccxaddintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/prfchiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/raointintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/contracts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cp-trait.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-infer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/m2 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/m2/m2-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/make-unique.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opts-jobserver.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-range-storage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/xcoff.h was removed

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:27db9f18935cb0bf20f04bd6fdf3a846b363acbc"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 190 Local 46 Mirrors 0 Missed 144 Current 903 (24% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 931 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 959 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 974 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1068 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1087 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.6-r0/temp/log.do_packagedata_setscene.98244
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1090 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gobject-introspection/1.74.0-r0/temp/log.do_packagedata_setscene.98304
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1091 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Started
NOTE: Running task 1970 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_fetch)
NOTE: Running task 1971 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2109 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_write_config)
NOTE: Running task 2130 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2131 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2210 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2233 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2234 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2243 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2267 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_unpack)
NOTE: Running task 2288 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 2289 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 2316 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2324 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2325 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2342 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2353 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2354 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2357 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2382 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Started
NOTE: Running task 2386 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Succeeded
NOTE: Running task 2390 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2401 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: Running task 2402 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: Running task 2427 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2460 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2492 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2497 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_fetch)
NOTE: Running task 2498 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2499 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2500 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2523 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 2537 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 2538 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2545 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: Running task 2546 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: Running task 2549 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2550 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2552 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2553 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2555 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_unpack)
NOTE: Running task 2556 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2557 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2558 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2566 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2570 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 2576 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2577 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2578 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_fetch)
NOTE: Running task 2579 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2580 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: Running task 2597 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2603 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2613 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2614 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2616 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: Running task 2625 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2634 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2635 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2649 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2650 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2655 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 2665 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2672 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2675 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2676 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2683 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2684 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_unpack)
NOTE: Running task 2688 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2689 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2690 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2694 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Started
NOTE: Running task 2709 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2710 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2711 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2712 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2723 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: Running task 2739 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_write_config)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Running task 2740 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2741 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: Running task 2742 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2748 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2750 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2751 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_patch)
NOTE: Running task 2752 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: Running task 2786 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2805 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2818 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2819 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2820 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2821 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2822 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2823 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2824 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 2825 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2826 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 2827 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2828 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2829 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_write_config)
NOTE: Running task 2830 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Started
NOTE: Running task 2831 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2845 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2865 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_unpack)
NOTE: Running task 2873 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2874 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2896 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2927 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2958 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2959 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2960 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2961 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2962 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 2963 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2964 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2990 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2994 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2995 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2996 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2997 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 3006 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: Running task 3015 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_write_config)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3033 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3034 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3035 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3036 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3097 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3135 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 3136 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Started
NOTE: Running task 3137 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3138 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_collect_spdx_deps)
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3139 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Started
NOTE: Running task 3142 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3150 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3151 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3152 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3153 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3154 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3155 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3156 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3157 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: Running task 3163 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 3164 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3165 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3166 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3167 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3168 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3185 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: Running task 3186 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3203 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 3204 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3205 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3206 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Started
NOTE: Running task 3207 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3208 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3209 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3211 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3212 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_collect_spdx_deps)
NOTE: Running task 3222 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Started
NOTE: Running task 3223 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3224 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3225 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: Running task 3226 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3246 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3247 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3287 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3289 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3290 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3291 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3292 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 3293 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 3294 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_patch)
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3295 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Succeeded
NOTE: Running task 3296 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3297 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3298 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3299 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic unihash changed to 459201ab9f27743b20a0928121bb8cd3b90fe09fd5ca2eb9707d1451b34fa0e4
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3300 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3301 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3302 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3303 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3304 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3305 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3307 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 3308 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 3309 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3310 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3311 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3312 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3313 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3314 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3315 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3316 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3317 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3318 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3319 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3320 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3321 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3322 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: Running task 3323 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3324 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3325 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Started
NOTE: Running task 3326 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3327 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3328 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3329 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3330 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3331 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3332 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3333 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3334 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3335 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3336 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3337 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package_write_rpm)
NOTE: Running task 3338 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3339 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3340 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3341 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3342 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3343 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: Running task 3344 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3345 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3346 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3347 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3348 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3349 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3350 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3351 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3352 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3357 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3358 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3359 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3360 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3361 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3362 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3363 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: Running task 3364 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3365 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3366 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3367 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 3368 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 3369 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3370 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3371 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3372 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3373 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3374 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3375 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3376 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_collect_spdx_deps)
NOTE: Running task 3377 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3378 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3379 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3380 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 3381 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 3382 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3383 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: Running task 3384 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3385 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3386 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3387 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3388 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3389 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: Running task 3390 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 3391 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: Running task 3392 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3393 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3394 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3395 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3396 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3397 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3398 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3399 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3400 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 3401 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: Running task 3402 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3403 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3404 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3405 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3406 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3407 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: Running task 3408 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3409 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3410 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 3411 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3412 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_create_spdx)
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3413 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3414 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3415 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3416 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3417 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3418 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 3419 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 3420 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3421 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3422 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3423 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3424 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3425 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3426 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 3427 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3428 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3429 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3430 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3431 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3432 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3433 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3434 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3435 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3436 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 3437 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3438 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3439 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3440 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3441 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3442 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3443 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3444 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3445 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3446 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3447 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3448 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3449 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3450 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3451 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3452 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3453 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3454 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 3455 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 3456 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 3457 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3458 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3459 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 3460 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3461 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3462 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3463 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3464 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3465 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_package)
NOTE: Running task 3466 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3467 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3468 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3469 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_compile)
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3470 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3471 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3472 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3473 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_install)
NOTE: recipe gtk4-4.10.4-r0: task do_install: Started
NOTE: recipe gtk4-4.10.4-r0: task do_install: Succeeded
NOTE: Running task 3474 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package)
NOTE: Running task 3475 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_package: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package: Succeeded
NOTE: Running task 3476 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_packagedata)
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3477 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_spdx)
NOTE: Running task 3478 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_write_rpm)
NOTE: Running task 3479 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_qa)
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3480 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3481 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3481 tasks of which 3124 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:27db9f18935cb0bf20f04bd6fdf3a846b363acbc"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 190 Local 46 Mirrors 0 Missed 144 Current 903 (24% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 931 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 959 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 974 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1068 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1087 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1088 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.6-r0/temp/log.do_packagedata_setscene.603762
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1090 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gobject-introspection/1.74.0-r0/temp/log.do_packagedata_setscene.603787
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1091 of 1093 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Started
NOTE: Running task 1970 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_fetch)
NOTE: Running task 1971 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2109 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_write_config)
NOTE: Running task 2130 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2131 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2206 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2230 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2231 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_unpack)
NOTE: Running task 2232 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2236 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: Running task 2241 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2274 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2297 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2320 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 2321 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: Running task 2349 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2390 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2393 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2403 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2405 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2407 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2408 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2412 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2413 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2444 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2495 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2496 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2497 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_fetch)
NOTE: Running task 2498 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2501 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2513 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2523 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2534 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: Running task 2535 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2539 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 2540 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2547 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2548 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 2554 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2555 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2558 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_patch)
NOTE: Running task 2559 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2560 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2565 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2572 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2579 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 2580 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2581 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2582 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_fetch)
NOTE: Running task 2583 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2601 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: Running task 2602 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 2603 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: Running task 2613 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2618 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 2623 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: Running task 2650 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2657 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2658 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2659 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 2660 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2661 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2669 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2670 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2677 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2678 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_unpack)
NOTE: Running task 2679 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2680 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2687 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2705 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2706 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2707 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2708 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2718 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2731 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: Running task 2736 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2737 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2738 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Started
NOTE: Running task 2739 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Running task 2740 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2741 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_write_config)
NOTE: Running task 2747 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 2748 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2750 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2814 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2815 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2816 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2818 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2819 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2820 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_write_config)
NOTE: Running task 2821 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2830 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2831 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_patch)
NOTE: Running task 2832 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 2833 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2834 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 2841 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2842 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_unpack)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2860 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2861 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2871 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2872 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2911 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: Running task 2918 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 2926 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Started
NOTE: Running task 2927 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2928 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2940 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2959 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2988 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2997 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2998 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3007 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_write_config)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3058 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3059 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3087 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3110 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3125 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3126 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3127 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 3129 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Started
NOTE: Running task 3130 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_patch)
NOTE: Running task 3131 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3132 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: Running task 3133 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3134 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3135 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3136 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3137 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 3138 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_collect_spdx_deps)
NOTE: Running task 3139 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3140 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3141 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: Running task 3144 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 3152 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3158 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3159 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: Running task 3160 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 3167 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 3182 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3183 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3184 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3195 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3196 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 3197 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: Running task 3199 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3211 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3212 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3213 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3214 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: Running task 3215 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3216 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 3217 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3218 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3219 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3220 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3221 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: Running task 3222 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 3223 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3224 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: Running task 3225 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3235 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3236 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: Running task 3247 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3248 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3285 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Started
NOTE: Running task 3289 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3290 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3291 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3292 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_collect_spdx_deps)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3293 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3294 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 3295 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_patch)
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3296 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3297 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3298 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic)
NOTE: Running task 3299 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3300 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3301 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 3302 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic unihash changed to 459201ab9f27743b20a0928121bb8cd3b90fe09fd5ca2eb9707d1451b34fa0e4
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3303 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3304 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3305 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3306 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3307 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 3308 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 3309 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3310 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3311 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3312 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3313 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3314 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3315 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: Running task 3316 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3317 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3318 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: Running task 3319 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3320 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3321 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3322 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3323 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3324 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3325 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3326 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3327 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3328 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3329 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3330 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3331 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3332 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3333 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3334 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3335 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3336 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: Running task 3337 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3338 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3339 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3340 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package_write_rpm)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3341 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3342 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: Running task 3343 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: Running task 3348 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3349 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: Running task 3350 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3351 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3352 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3353 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3354 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3355 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3356 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3357 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3358 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3359 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: Running task 3360 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3361 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3362 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3363 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3364 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3365 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3366 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: Running task 3367 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3368 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3369 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3370 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3371 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3372 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3373 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3374 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3375 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3376 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_collect_spdx_deps)
NOTE: Running task 3377 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3378 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3379 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3380 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Started
NOTE: Running task 3381 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 3382 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3383 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3384 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3385 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3386 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3387 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3388 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3389 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3390 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 3391 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3392 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3393 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3394 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3395 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3396 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3397 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3398 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3399 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3400 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3401 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3402 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3403 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 3404 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: Running task 3405 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3406 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3407 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3408 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3409 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3410 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 3411 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3412 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_create_spdx)
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3413 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3414 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3415 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3416 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3417 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3418 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3419 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3420 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 3421 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 3422 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3423 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3424 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3425 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3426 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3427 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3428 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3429 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 3430 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3431 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_create_spdx)
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3432 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3433 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3434 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 3435 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3436 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3437 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3438 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3439 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3440 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3441 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3442 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3443 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3444 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3445 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3446 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3447 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3448 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3449 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3450 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3451 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3452 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3453 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3454 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 3455 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 3456 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 3457 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3458 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3459 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 3460 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3461 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3462 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3463 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3464 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3465 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_package)
NOTE: Running task 3466 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3467 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3468 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3469 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_compile)
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3470 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3471 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3472 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3473 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_install)
NOTE: recipe gtk4-4.10.4-r0: task do_install: Started
NOTE: recipe gtk4-4.10.4-r0: task do_install: Succeeded
NOTE: Running task 3474 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package)
NOTE: Running task 3475 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_package: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package: Succeeded
NOTE: Running task 3476 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_packagedata)
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3477 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_spdx)
NOTE: Running task 3478 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_write_rpm)
NOTE: Running task 3479 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_qa)
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3480 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3481 of 3481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3481 tasks of which 3124 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.3", added "/usr/lib/libgtk-4.so.1.1000.4"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.3 to libgtk-4.so.1.1000.4
  /usr/lib/libgtk-4.so.1.1000.3 moved to /usr/lib/libgtk-4.so.1.1000.4
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-13.1.1 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.1.1/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxcomplexintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxfp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxneconvertintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxvnniint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cmpccxaddintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/prfchiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/raointintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/contracts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cp-trait.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-infer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/m2 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/m2/m2-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/make-unique.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opts-jobserver.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-range-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-range-storage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.1.1/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-13.1.1 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxcomplexintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxfp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxneconvertintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxvnniint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cmpccxaddintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/prfchiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/raointintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/contracts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cp-trait.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-infer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/m2 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/m2/m2-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/make-unique.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opts-jobserver.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-range-storage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.1.1/plugin/include/xcoff.h was removed

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:27db9f18935cb0bf20f04bd6fdf3a846b363acbc"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 185 Local 46 Mirrors 0 Missed 139 Current 895 (24% match, 87% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 923 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 966 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1055 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1074 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1075 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.6-r0/temp/log.do_packagedata_setscene.353672
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1077 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gobject-introspection/1.74.0-r0/temp/log.do_packagedata_setscene.353819
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1078 of 1080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Started
NOTE: Running task 1958 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_fetch)
NOTE: Running task 1959 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2097 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_write_config)
NOTE: Running task 2118 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2119 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2198 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2229 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 2236 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2237 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2275 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2281 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_unpack)
NOTE: Running task 2303 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2334 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2358 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2362 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2365 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2367 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2369 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2373 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2375 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2377 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Started
NOTE: Running task 2388 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2412 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2475 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_fetch)
NOTE: Running task 2476 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2477 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2478 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2494 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2502 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2512 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2513 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2524 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2525 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: Running task 2528 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 2545 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2546 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_fetch)
NOTE: Running task 2547 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2548 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2549 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Started
NOTE: Running task 2574 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2575 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2588 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2589 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2601 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_unpack)
NOTE: Running task 2603 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2608 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2614 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2615 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_patch)
NOTE: Running task 2616 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 2617 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: Running task 2655 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2656 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2667 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2683 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2684 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2685 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe freetype-2.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2686 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2687 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_unpack)
NOTE: Running task 2688 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: Running task 2690 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2693 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 2698 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2699 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2700 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Started
NOTE: Running task 2701 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2702 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 2703 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2704 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2705 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2707 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2708 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2714 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 2715 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2717 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_fetch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Started
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2733 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2734 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2735 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Running task 2754 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2785 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2786 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2787 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2788 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2789 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2790 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2791 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_write_config)
NOTE: Running task 2792 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2793 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2794 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2795 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2804 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2805 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2806 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 2807 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 2812 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: Running task 2813 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2814 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2843 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2844 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: Running task 2845 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2852 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2853 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2909 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2929 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2930 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Started
NOTE: Running task 2957 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2972 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 2973 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2974 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2975 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2978 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_write_config)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2987 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2988 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2989 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2990 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_patch)
NOTE: Running task 2991 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2992 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 3062 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3090 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3100 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Started
NOTE: Running task 3101 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3102 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 3104 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3117 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3118 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 3119 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3120 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3133 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Started
NOTE: Running task 3138 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3139 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 3140 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 3141 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3142 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3152 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3153 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.115-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3154 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3155 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: Running task 3164 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3165 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3166 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3167 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: Running task 3168 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3169 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3170 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3171 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3181 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3182 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3183 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3184 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe fontconfig-2.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3185 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx)
NOTE: Running task 3186 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3187 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 3207 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3236 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3246 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3247 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Started
NOTE: Running task 3248 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_create_spdx)
NOTE: Running task 3250 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3252 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3253 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3254 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3255 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3256 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3257 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3258 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 3259 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3260 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3261 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Succeeded
NOTE: Running task 3262 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3263 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3264 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 3265 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_create_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic unihash changed to 459201ab9f27743b20a0928121bb8cd3b90fe09fd5ca2eb9707d1451b34fa0e4
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3266 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Started
NOTE: Running task 3267 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3268 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3269 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3270 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 3271 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3272 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 3273 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3274 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3275 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: Running task 3276 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3277 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3278 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3279 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3280 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3281 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3282 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3283 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: Running task 3284 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3285 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3286 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3287 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile)
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3288 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3289 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3290 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3291 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3292 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3293 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3294 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3295 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3296 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: Running task 3297 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3298 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3299 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3300 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3301 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3302 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3303 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3308 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: Running task 3309 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3310 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: Running task 3312 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3313 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3314 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3315 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3316 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3317 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 3318 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3319 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3320 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3321 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3322 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3323 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3324 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3325 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3326 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3327 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3328 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3329 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 3330 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3331 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3332 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3333 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3334 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_collect_spdx_deps)
NOTE: Running task 3335 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3336 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3337 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3338 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 3339 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 3340 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3341 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3342 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3343 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3344 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3345 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 3346 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3347 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3348 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3349 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3350 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3351 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3352 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3353 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3354 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3355 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3356 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3357 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 3358 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: Running task 3359 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3360 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3361 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3362 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3363 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_configure)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Started
NOTE: Running task 3364 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3365 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3366 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3367 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3368 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 3369 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3370 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3371 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3372 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3373 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3374 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3375 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3376 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3377 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3378 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3379 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3380 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3381 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3382 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3383 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 3384 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 3385 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3386 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3387 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3388 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 3389 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3390 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_create_spdx)
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3391 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3392 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 3393 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3394 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3395 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3396 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3397 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3398 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3399 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3400 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3401 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3402 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3403 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3404 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3405 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3406 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3407 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3408 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3409 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3410 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3411 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3412 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 3413 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 3414 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 3415 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3416 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3417 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 3418 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3419 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3420 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3421 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3422 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3423 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_package)
NOTE: Running task 3424 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3425 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3426 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3427 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_compile)
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3428 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3429 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3430 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3431 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_install)
NOTE: recipe gtk4-4.10.4-r0: task do_install: Started
NOTE: recipe gtk4-4.10.4-r0: task do_install: Succeeded
NOTE: Running task 3432 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package)
NOTE: Running task 3433 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_package: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package: Succeeded
NOTE: Running task 3434 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_packagedata)
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3435 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_spdx)
NOTE: Running task 3436 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_write_rpm)
NOTE: Running task 3437 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_qa)
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3438 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3439 of 3439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3439 tasks of which 3096 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1767135431344165437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27db9f18935cb0bf20f04bd6fdf3a846b363acbc"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 656 Local 528 Mirrors 0 Missed 128 Current 430 (80% match, 88% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86...done.
Removing 3 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 431 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 453 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 454 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_create_spdx_setscene)
NOTE: Running setscene task 483 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1086 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-native-2.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 618 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 621 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 640 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-native-2.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1086 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 667 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running task 827 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_fetch)
NOTE: Running task 828 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 857 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 860 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 869 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 896 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_write_config)
NOTE: Running task 898 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 899 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 926 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 941 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: Running task 952 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 953 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 974 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 975 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 675 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1001 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1002 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1003 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1004 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_fetch)
NOTE: Running task 1015 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 1024 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1025 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_fetch)
NOTE: Running task 1026 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1027 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 1028 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 1067 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1068 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_write_config)
NOTE: Running task 1071 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_fetch)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: Running task 1092 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_write_config)
NOTE: Running task 1093 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1101 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Started
NOTE: Running setscene task 677 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 1126 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 1128 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 1145 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1146 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Started
NOTE: Running task 1167 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1168 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 1196 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: Running task 1207 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1225 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: Running task 1229 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_fetch: Started
NOTE: Running setscene task 688 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: Running setscene task 689 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running setscene task 691 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 694 of 1086 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running setscene task 695 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 1241 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 1242 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1243 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 1244 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1245 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 1246 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 1247 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1248 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Started
NOTE: Running task 1249 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_unpack)
NOTE: Running task 1250 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: Running task 1251 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 1252 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1253 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1254 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.6-r0/temp/log.do_packagedata_setscene.867191
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 697 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 1255 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 1256 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: Running task 1257 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe gtk4-4.10.4-r0: task do_write_config: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1262 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Started
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1263 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: Running setscene task 701 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 702 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running task 1264 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 1265 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 1267 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1273 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 1274 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1276 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 1278 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 1279 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 1280 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1281 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1282 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 1283 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 1284 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1285 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: Running task 1286 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 1287 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_create_spdx_setscene)
NOTE: Running task 1288 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 1289 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running setscene task 712 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running task 1290 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1291 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1292 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 1293 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1294 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 1295 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 1296 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1297 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1298 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 1299 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 1300 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 715 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1301 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_patch)
NOTE: Running task 1314 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 717 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 1315 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 719 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 722 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 725 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_unpack: Succeeded
NOTE: Running task 1316 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 736 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 737 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 738 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 739 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 740 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 741 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1319 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1769 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.10.4-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1912 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 813 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 823 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 825 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_lic unihash changed to 459201ab9f27743b20a0928121bb8cd3b90fe09fd5ca2eb9707d1451b34fa0e4
NOTE: Running setscene task 829 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 831 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 912 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gobject-introspection/1.74.0-r0/temp/log.do_packagedata_setscene.880446
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 934 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2109 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2110 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2111 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 961 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 965 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 970 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 976 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1005 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1006 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1008 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1028 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1040 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 2250 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1084 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2817 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2818 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2844 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: Running task 2865 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2926 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2974 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3013 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3019 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3067 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3068 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: Running task 3091 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3092 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3093 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3094 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3102 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: Running task 3144 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3148 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3163 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3166 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3179 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3186 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3187 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 3198 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3199 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3216 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3217 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 3218 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3221 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: Running task 3222 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 3223 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 3233 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3234 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Started
NOTE: Running task 3235 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: Running task 3236 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: Running task 3237 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3242 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3246 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 3247 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: Running task 3255 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3256 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure)
NOTE: Running task 3257 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3258 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3259 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3260 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3261 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3262 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Succeeded
NOTE: Running task 3263 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3264 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_configure)
NOTE: recipe adwaita-icon-theme-43-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3265 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: Running task 3266 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3267 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3268 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3269 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3270 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: Running task 3271 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 3272 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3273 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe adwaita-icon-theme-43-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3274 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3275 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe adwaita-icon-theme-43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: Running task 3276 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_compile)
NOTE: recipe adwaita-icon-theme-43-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3278 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3279 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3280 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3281 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3282 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3283 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3284 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3285 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3286 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 3287 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3288 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3289 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: Running task 3290 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3291 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3292 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3293 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package_write_rpm)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3294 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Started
NOTE: Running task 3295 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 3296 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3297 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: Running task 3298 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3299 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3300 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3301 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3302 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: Running task 3303 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: Running task 3304 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3305 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: Running task 3306 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3307 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 3308 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3309 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3312 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3314 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: Running task 3315 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3316 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3317 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3318 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3319 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: Running task 3320 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3321 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: Running task 3322 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3323 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3324 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3325 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3326 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3327 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: Running task 3328 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3329 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3330 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3331 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3332 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3333 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3334 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_collect_spdx_deps)
NOTE: Running task 3335 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_compile: Succeeded
NOTE: Running task 3336 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_install)
NOTE: recipe adwaita-icon-theme-43-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3337 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3338 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3339 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 3340 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 3341 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3342 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Running task 3343 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3344 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_compile_ptest_base)
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3345 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3346 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3347 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3348 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3349 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3350 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3351 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3352 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3353 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_package)
NOTE: Running task 3354 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Started
NOTE: Running task 3355 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3356 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Succeeded
NOTE: Running task 3357 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3358 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3359 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3360 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3361 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3362 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunwind-1.6.2-r0: task do_install: Succeeded
NOTE: Running task 3363 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot)
NOTE: Running task 3364 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 3365 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: Running task 3366 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3367 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3368 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3369 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3370 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3371 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3372 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3373 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3374 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3375 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_package: Succeeded
NOTE: Running task 3376 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3377 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3378 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3379 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: Running task 3380 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 3381 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3382 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_create_spdx)
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3383 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3384 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3385 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3386 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3387 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 3388 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 3389 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3390 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3391 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 3392 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3393 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_create_spdx)
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3394 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3395 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3396 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3397 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3398 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3399 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3400 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3401 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3402 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3403 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3404 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3405 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_populate_sysroot)
NOTE: Running task 3406 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3407 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3408 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3409 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3410 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3411 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3412 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3413 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3414 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe adwaita-icon-theme-43-r0: task do_install: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3415 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3416 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe adwaita-icon-theme-43-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3417 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3418 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3419 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3420 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3421 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3422 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3423 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3424 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 3425 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_package: Succeeded
NOTE: Running task 3426 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata unihash changed to e06e9f5fc3e14e501de9145ac9a42f43be98d3f8e622c94be4723d4b64cdc51a
NOTE: Setscene tasks completed
NOTE: Running task 3427 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_create_spdx)
NOTE: Running task 3428 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package_write_rpm)
NOTE: recipe adwaita-icon-theme-43-r0: task do_create_spdx: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_package_write_rpm: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_create_spdx: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package_write_rpm unihash changed to 213036bd920d04b82c31e2782325268a122d2f88b89cb5d15afbfbf588c35b10
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 3429 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 3430 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 3431 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3432 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3433 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 3434 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3435 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3436 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 3437 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 3438 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 3439 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_package)
NOTE: Running task 3440 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3441 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3442 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_configure)
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3443 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_compile)
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 3444 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3445 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3446 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3447 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_install)
NOTE: recipe gtk4-4.10.4-r0: task do_install: Started
NOTE: recipe gtk4-4.10.4-r0: task do_install: Succeeded
NOTE: Running task 3448 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package)
NOTE: Running task 3449 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.4-r0: task do_package: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package: Succeeded
NOTE: Running task 3450 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_packagedata)
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3451 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_spdx)
NOTE: Running task 3452 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_write_rpm)
NOTE: Running task 3453 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_package_qa)
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3454 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.10.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3455 of 3455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3455 tasks of which 3108 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-src went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dbg went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-staticdev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-dev went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-doc went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection-locale went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: QA Issue: Package version for package gobject-introspection went backwards which would break package feeds (from 0:1.76.1-r0 to 0:1.74.0-r0) [version-going-backwards]
ERROR: gobject-introspection-1.74.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1767135431344165437==--

