Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B7FC54742
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.131441.1723748335364311230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QihdxQxC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uxZSPsrF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019157683ce5-5aa2d9c0-cd66-44be-8cea-a0f6515a6bd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FHMGz1dZITmicCp1DUAV9JmY+4a74kYVGTSEktv2TD8=;
	b=QihdxQxC3JCscFBqgrKBtE5oyZ/EOwxCtZyoRZuxkvKJVFGQeNSCS3Y9M6pTFepK
	llIn4uSGlOWzJVmV2pr9nwvL9vNB317S9LP7NpmPOz4r2GtG+e4tq415aFuKZvgFwO3
	jD54dSVAfSV0ViFyMCQ8WW/oHA/px3unLGDNhP3g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FHMGz1dZITmicCp1DUAV9JmY+4a74kYVGTSEktv2TD8=;
	b=uxZSPsrFGxvvgFvVCUOgj6xJxgmw1RVeDm6c0mCClgPmr2py7DMcmhNZQreL+VfR
	vgiGeMkuGjPFgeYc4KLKqrCucDH5qdB1PTljsyv44poTC+OgsPzQHVqsgs78Sy94eu6
	J+b6erqwU1NbCXNzcKBCUNZvCAYotUbt46qzipfk=
Content-Type: multipart/mixed; boundary="===============9193236800486001681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 46.2 FAILED
Message-ID: <0101019157683ce5-5aa2d9c0-cd66-44be-8cea-a0f6515a6bd9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203419

--===============9193236800486001681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *adwaita-icon-theme* to *46.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-adwaita-icon-theme-upgrade-46.0-46.2.patch
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
From 01f3cc290bda0d7bb6237696d0d90e97ece23e02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 14:51:38 +0000
Subject: [PATCH] adwaita-icon-theme: upgrade 46.0 -> 46.2

---
 .../{adwaita-icon-theme_46.0.bb => adwaita-icon-theme_46.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_46.0.bb => adwaita-icon-theme_46.2.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
index 2f3e4e7b85..14d26ebd19 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "4bcb539bd75d64da385d6fa08cbaa9ddeaceb6ac8e82b85ba6c41117bf5ba64e"
+SRC_URI[archive.sha256sum] = "beb126b9429339ba762e0818d5e73b2c46f444975bf80076366eae2d0f96b5cb"
 
 DEPENDS += "librsvg-native"
 
-- 
2.44.0


--===============9193236800486001681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-64 sysroot...done.
Removing 89 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-59fd290e343a22a4b34fa5d3799f9ec179a378b2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:59fd290e343a22a4b34fa5d3799f9ec179a378b2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 731 Local 712 Mirrors 0 Missed 19 Current 418 (97% match, 98% complete)
Removing 11 stale sstate objects for arch allarch...done.
Removing 6 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 434 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 441 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 445 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 1149 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 561 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-native-2.58.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 602 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-native-2.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 605 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 628 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 632 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 661 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 673 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 681 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 687 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 702 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 704 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 706 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 720 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 723 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 727 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 735 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 739 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 740 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 743 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 747 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 759 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 770 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 772 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 776 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 778 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 779 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 781 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 1149 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 871 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 873 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 875 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 883 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-native-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 885 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 895 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 896 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 906 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 907 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 915 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 917 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-native-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1149 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.77.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 925 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.77.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 937 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 938 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 892 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1084 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1085 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-native-1.77.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1149 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.77.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1370 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1393 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.77.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1501 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: Running task 1506 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_patch)
NOTE: Running task 1522 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1578 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 967 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_patch: Started
NOTE: Running setscene task 974 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 978 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 979 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 983 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 985 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 992 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.77.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1008 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1009 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1010 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1626 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1627 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1638 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_populate_lic)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_populate_lic: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_deploy_source_date_epoch unihash changed to 6f7d9e12af0c2717c9e0fe61ce23e6bd94e9135dffca9c2387a1fa582d042410
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_populate_lic unihash changed to 2ae02488af0c8e6fa03a4b79a407c8347b55f5652546fecdf653371bb74057f6
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1028 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1031 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1033 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1036 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1040 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1044 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1045 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1050 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1054 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1066 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1068 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1071 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1072 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1073 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1079 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1081 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1084 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1085 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1089 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1100 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1122 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1126 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1129 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1135 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1140 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1142 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1145 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1149 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: Running task 2332 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2796 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash b1afae992cebd89cab947ad8405ae7716a4f41364642650ae2d67f407afc766c to wss://hashserv.yoctoproject.org/ws ({'taskhash': '5366aa172f628490911feb7906d070b13aa6f4e706594a6fd420ac2d33d4d1ea', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b1afae992cebd89cab947ad8405ae7716a4f41364642650ae2d67f407afc766c'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5366aa172f628490911feb7906d070b13aa6f4e706594a6fd420ac2d33d4d1ea -> b1afae992cebd89cab947ad8405ae7716a4f41364642650ae2d67f407afc766c as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3185 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3186 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash b1afae992cebd89cab947ad8405ae7716a4f41364642650ae2d67f407afc766c to wss://hashserv.yoctoproject.org/ws ({'taskhash': '18185c55036d7d7fd36e65098de8275a6057ec767b652df5f32479f1b17a683b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b1afae992cebd89cab947ad8405ae7716a4f41364642650ae2d67f407afc766c'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 18185c55036d7d7fd36e65098de8275a6057ec767b652df5f32479f1b17a683b -> b1afae992cebd89cab947ad8405ae7716a4f41364642650ae2d67f407afc766c as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3196 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3197 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Running task 3198 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: Running task 3199 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_install)
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_package)
NOTE: Running task 3201 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3202 of 3218 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe adwaita-icon-theme-46.2-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 3202 tasks of which 3176 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815144959.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815144959.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_prepare_recipe_sysroot
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: adwaita-icon-theme-46.2-r0 do_prepare_recipe_sysroot: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/meta/classes-global/staging.bbclass', lineno: 619, function: extend_recipe_sysroot
     0615:                    if "/bin/" in l or "/sbin/" in l:
     0616:                        # defer /*bin/* files until last in case they need libs
     0617:                        binfiles[l] = (targetdir, dest)
     0618:                    else:
 *** 0619:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0620:
     0621:    # Handle deferred binfiles
     0622:    for l in binfiles:
     0623:        (targetdir, dest) = binfiles[l]
File: '/home/pokybuild/yocto-worker/auh/build/meta/classes-global/staging.bbclass', lineno: 157, function: staging_copyfile
     0153:    if os.path.islink(c):
     0154:        linkto = os.readlink(c)
     0155:        if os.path.lexists(dest):
     0156:            if not os.path.islink(dest):
 *** 0157:                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
     0158:            if os.readlink(dest) == linkto:
     0159:                return dest
     0160:            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
     0161:        os.symlink(linkto, dest)
Exception: FileExistsError: [Errno 17] Link /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/46.2/recipe-sysroot/usr/include/c++/14.2.0/x86_64-poky-linux already exists as a file: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/46.2/recipe-sysroot/usr/include/c++/14.2.0/x86_64-poky-linux'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/46.2/temp/log.do_prepare_recipe_sysroot.1456807
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb:do_prepare_recipe_sysroot) failed with exit code '1'

--===============9193236800486001681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-adwaita-icon-theme-upgrade-46.0-46.2.patch"

RnJvbSAwMWYzY2MyOTBiZGEwZDdiYjYyMzc2OTZkMGQ5MGU5N2VjZTIzZTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTQ6NTE6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
ZHdhaXRhLWljb24tdGhlbWU6IHVwZ3JhZGUgNDYuMCAtPiA0Ni4yCgotLS0KIC4uLi97YWR3YWl0
YS1pY29uLXRoZW1lXzQ2LjAuYmIgPT4gYWR3YWl0YS1pY29uLXRoZW1lXzQ2LjIuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS97YWR3YWl0YS1pY29uLXRoZW1lXzQ2LjAuYmIgPT4g
YWR3YWl0YS1pY29uLXRoZW1lXzQ2LjIuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdub21lL2dub21lL2Fkd2FpdGEtaWNvbi10aGVtZV80Ni4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdub21lL2dub21lL2Fkd2FpdGEtaWNvbi10aGVtZV80Ni4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS9hZHdhaXRhLWljb24tdGhl
bWVfNDYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2dub21lL2Fkd2FpdGEtaWNv
bi10aGVtZV80Ni4yLmJiCmluZGV4IDJmM2U0ZTdiODUuLjE0ZDI2ZWJkMTkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS9hZHdhaXRhLWljb24tdGhlbWVfNDYuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ25vbWUvZ25vbWUvYWR3YWl0YS1pY29uLXRoZW1lXzQ2LjIuYmIKQEAg
LTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yzg0
Y2FjODhlNDZmYzA3NjQ3ZWEwN2U2YzI0ZWViN2MgXAogCiBpbmhlcml0IGdub21lYmFzZSBhbGxh
cmNoIGd0ay1pY29uLWNhY2hlCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjRiY2I1
MzliZDc1ZDY0ZGEzODVkNmZhMDhjYmFhOWRkZWFjZWI2YWM4ZTgyYjg1YmE2YzQxMTE3YmY1YmE2
NGUiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJiZWIxMjZiOTQyOTMzOWJhNzYyZTA4
MThkNWU3M2IyYzQ2ZjQ0NDk3NWJmODAwNzYzNjZlYWUyZDBmOTZiNWNiIgogCiBERVBFTkRTICs9
ICJsaWJyc3ZnLW5hdGl2ZSIKIAotLSAKMi40NC4wCgo=

--===============9193236800486001681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: FILELIST: added "/usr/share/icons/Adwaita/cursors/dnd-move"
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/cursors/dnd-move was added

--===============9193236800486001681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: FILELIST: added "/usr/share/icons/Adwaita/cursors/dnd-move"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGSIZE changed from 10504544 to 10504551 (+0%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dbg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dbg: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dev: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dev: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-doc: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-doc: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-locale: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-locale: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-staticdev: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-staticdev: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGSIZE changed from 732624 to 732594 (-0%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGSIZE changed from 499086 to 499112 (+0%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PV changed from "46.0" to "46.2"
packages/all-poky-linux/adwaita-icon-theme: PKGV changed from 46.0 [default] to 46.2 [default]
packages/all-poky-linux/adwaita-icon-theme: SRC_URI changed from "https://download.gnome.org/sources//adwaita-icon-theme/46/adwaita-icon-theme-46.0.tar.xz;name=archive" to "https://download.gnome.org/sources//adwaita-icon-theme/46/adwaita-icon-theme-46.2.tar.xz;name=archive"
packages/all-poky-linux/adwaita-icon-theme: PV changed from "46.0" to "46.2"
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/cursors/dnd-move was added

--===============9193236800486001681==--

