Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AD3C4707C
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63135.1702649863174295430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TOey1Y4m;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RJM2uIno;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd72de4-b09667a1-3fb0-4389-81bf-01fde95d551f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eNI//aB9bb1ytzAAsp1pgRld1JRqZ9EXT8ckwBgKW2c=;
	b=TOey1Y4mylP2XJa6sZaVX6LuAN+E9edm/7q9PHWYMlp9ymTjJNuHBb3x/JQriDHX
	JaR+rOHWghUiPeOeE8+EYzg20UPLl1Vx+qezcijTDkKWDXh43mhthQX8mgpcIyh8SG/
	xJX4BbbddF+tuwjT1HVoQCgdqW7LL2C8mwjoU72A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eNI//aB9bb1ytzAAsp1pgRld1JRqZ9EXT8ckwBgKW2c=;
	b=RJM2uInoPa/VEE4fl9wRzcQmeKd7RuX8gfF0GrOlVwsERnB5AuB6dkD+9f0kU+Gf
	7y6YI6MsDEhkxvmNjkotgfP7CGlfR/Q1ZOaorWzj+v0ia8QiIgNHYHSebJdt5EIFCND
	gRmUkRlwgyaOj0Q3KPKsL4b2bNdo8oIqMWCw/IVw=
Content-Type: multipart/mixed; boundary="===============7102020086171201756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.4.2 SUCCEEDED
Message-ID: <0101018c6dd72de4-b09667a1-3fb0-4389-81bf-01fde95d551f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192503

--===============7102020086171201756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libadwaita* to *1.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.4.0-1.4.2.patch
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
From c1f57c1079f9f15b79cea8afc1ffc221bca6c82e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 10:21:14 +0000
Subject: [PATCH] libadwaita: upgrade 1.4.0 -> 1.4.2

---
 .../libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
index cc05756805..edcfba54b6 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "e51a098a54d43568218fc48fcf52e80e36f469b3ce912d8ce9c308a37e9f47c2"
+SRC_URI[archive.sha256sum] = "33fa16754e7370c841767298b3ff5f23003ee1d2515cc2ff255e65ef3d4e8713"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.42.0


--===============7102020086171201756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 49 skipped, 0 masked, 0 errors.
Removing 122 recipes from the core2-64 sysroot...done.
Removing 121 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e20a28fe5fa474bb3de42ecbe5147ee478b7c0b7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e20a28fe5fa474bb3de42ecbe5147ee478b7c0b7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 908 Local 816 Mirrors 0 Missed 92 Current 395 (89% match, 92% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 434 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 457 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 460 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 462 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.71.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 482 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 483 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 487 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 509 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 516 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 522 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 524 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 533 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 536 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 537 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 538 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 545 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 550 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 555 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 563 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 566 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 569 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.71.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 571 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 572 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 574 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 579 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 580 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 582 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 592 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 594 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 600 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 607 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 611 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 613 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 622 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 627 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 632 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 636 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 643 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 651 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe appstream-0.16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 668 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-0.16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 678 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 679 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 710 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 712 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 719 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-0.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 726 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-0.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 733 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 755 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 756 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 758 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 763 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 773 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 778 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 782 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 788 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 789 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 797 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 803 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 813 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 831 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 832 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 835 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 837 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 851 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 853 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 858 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 870 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 875 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 876 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 880 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 882 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 884 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 887 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.13/temp/log.do_packagedata_setscene.3064591
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 891 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_package_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 913 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 919 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 945 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 952 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 959 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1022 of 1303 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_package_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1088 of 1303 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1094 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1099 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1101 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1102 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1106 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1107 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1112 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1118 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1121 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1123 of 1303 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1127 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1128 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1129 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1130 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1133 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1135 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1056 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1079 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_fetch)
NOTE: Running task 1082 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1089 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1171 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1173 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1138 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1140 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1143 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1147 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_fetch: Started
NOTE: Running task 1210 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1211 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_unpack)
NOTE: Running setscene task 1148 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1149 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1150 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1152 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1155 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1156 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1162 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1164 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1170 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.4/temp/log.do_packagedata_setscene.3066591
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1173 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_package_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1175 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1176 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1178 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1179 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1182 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_package_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1191 of 1303 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1201 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1203 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running task 1440 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1205 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1528 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 1529 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1540 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1541 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1570 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_write_config)
NOTE: Running task 1576 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1583 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1605 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: Running task 1621 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Started
NOTE: Running task 1622 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_fetch: Started
NOTE: Running setscene task 1210 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1669 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1670 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_fetch)
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_write_config: Started
NOTE: Running task 1681 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_unpack)
NOTE: recipe xz-5.4.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1690 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1212 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1691 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1214 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1215 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 1216 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1217 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1219 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_write_config: Started
NOTE: recipe bluez5-5.70-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: Running setscene task 1221 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1222 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 1223 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1225 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1707 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1708 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1709 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_patch: Started
NOTE: Running task 1721 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1722 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1230 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1232 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1233 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1234 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1724 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1725 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1726 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running setscene task 1237 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running task 1727 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running setscene task 1239 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1760 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1807 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1821 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running setscene task 1242 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.14-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1838 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_unpack)
NOTE: Running task 1840 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1867 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_patch)
NOTE: Running task 1880 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_fetch)
NOTE: Running task 1882 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 1912 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1913 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1917 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.70-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_fetch: Started
NOTE: Running task 1918 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1919 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1926 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_fetch: Started
NOTE: Running task 1938 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_fetch: Succeeded
NOTE: Running task 1945 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_unpack)
NOTE: Running task 1947 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 1974 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1975 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_unpack)
NOTE: Running task 1977 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1244 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1245 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1247 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1987 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.70-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1988 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe appstream-0.16.3-r0: task do_fetch: Started
NOTE: Running task 1989 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_unpack)
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Started
NOTE: recipe appstream-0.16.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 1993 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_write_config)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1995 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 1996 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2004 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_write_config: Started
NOTE: Running task 2010 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe appstream-0.16.3-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2017 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_write_config)
NOTE: Running task 2021 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2024 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2028 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2032 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_recipe_qa)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_unpack: Succeeded
NOTE: Running task 2033 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_patch)
NOTE: Running task 2034 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_patch)
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_unpack: Succeeded
NOTE: Running task 2035 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1249 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running setscene task 1250 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1251 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_patch: Started
NOTE: Running setscene task 1253 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_patch: Started
NOTE: recipe appstream-0.16.3-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Succeeded
NOTE: Running task 2051 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2057 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_write_config)
NOTE: Running task 2058 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2074 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2084 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_patch: Succeeded
NOTE: Running task 2160 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_fetch)
NOTE: recipe appstream-0.16.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe appstream-0.16.3-r0: task do_write_config: Started
NOTE: Running setscene task 1255 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Started
NOTE: Running task 2162 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_write_config: Started
NOTE: Running task 2163 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1257 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-0.16.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1258 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1260 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.4.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_patch: Started
NOTE: Running task 2171 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_unpack)
NOTE: recipe appstream-0.16.3-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1262 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_patch: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1264 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1265 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1267 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1269 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1271 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1272 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2188 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_populate_lic)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_populate_lic: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1278 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1279 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1281 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_populate_lic unihash changed to 3f1ab9d4365d09dee22e0c2a64e74dd0233a2cb4d23d8350309d6fed14d24780
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2198 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1288 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1289 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1292 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1294 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1295 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1301 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1303 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2738 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2747 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2752 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2772 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata)
NOTE: Running task 2795 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2822 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2915 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.4-r0: task do_packagedata: Started
NOTE: Running task 2931 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3038 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata)
NOTE: Running task 3040 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3066 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3088 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3109 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3112 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3214 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 3215 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3224 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3225 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: Running task 3253 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3266 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3282 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3283 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_configure)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3284 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3285 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe libxmlb-0.3.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3286 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3287 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: Running task 3288 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libxmlb-0.3.14-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3289 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3308 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_collect_spdx_deps)
NOTE: Running task 3309 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: Running task 3328 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe bluez5-5.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3329 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.70-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3340 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3341 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3344 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3351 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3352 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3355 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3358 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3359 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3371 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 835f10038f6b68f2a45c8966cf120a5298a830671c62f4ec5f17f2f80b9ef922 to hashserv.yocto.io:8686 ({'taskhash': '834e5ddd4b6876157084a31940771637d60be3c6fc7e45e18f047f087712683d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '835f10038f6b68f2a45c8966cf120a5298a830671c62f4ec5f17f2f80b9ef922'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 834e5ddd4b6876157084a31940771637d60be3c6fc7e45e18f047f087712683d -> 835f10038f6b68f2a45c8966cf120a5298a830671c62f4ec5f17f2f80b9ef922 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3377 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_collect_spdx_deps)
NOTE: Running task 3378 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.70-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.70-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3379 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3380 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 3381 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3382 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_configure: Succeeded
NOTE: Running task 3383 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.14-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3384 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_compile)
NOTE: recipe libxmlb-0.3.14-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3385 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Succeeded
NOTE: Running task 3386 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3387 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_compile)
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3388 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure: Succeeded
NOTE: Running task 3389 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_configure_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 3390 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3391 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3392 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3393 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3394 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 3395 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 3396 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3397 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3398 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3399 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3400 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_configure: Succeeded
NOTE: Running task 3401 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.70-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 7ac17007469966c084ef5df04bdde57e98fa4b92c5001a25763bfe9e02b09acf
NOTE: recipe bluez5-5.70-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3402 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: Running task 3403 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: Running task 3404 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_compile)
NOTE: Running task 3405 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.70-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3406 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3407 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxmlb-0.3.14-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 3408 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_compile_ptest_base)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 3409 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3410 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_install)
NOTE: recipe libxmlb-0.3.14-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Succeeded
NOTE: Running task 3411 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_install)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3412 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3413 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 3414 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.14-r0: task do_install: Succeeded
NOTE: Running task 3415 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_install_ptest_base)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_install_ptest_base: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 8aa0a2b588454386f94252519c9c38234cca704d49a6b6f121434742c4f1f525
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_install_ptest_base: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3416 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_populate_sysroot)
NOTE: Running task 3417 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 3418 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: Running task 3419 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_package)
NOTE: Running task 3420 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_package)
NOTE: Running task 3421 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.14-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3422 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3423 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe appstream-0.16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3424 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 3425 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3426 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3427 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe appstream-0.16.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3428 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe appstream-0.16.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3429 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 3430 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to fd706b8619f404afb34db3a84172e2e09644a0fb418bcc12e43d7c7a9088909b
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3431 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: Running task 3432 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3433 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: Running task 3434 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_package: Succeeded
NOTE: Running task 3435 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3436 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.14-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_packagedata unihash changed to 3a67667834532dd789c8141586a4b220dee42be27f96df9dfe35f9161d3debf1
NOTE: Running task 3437 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.14-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 7dda99c4504d77ccb69100fb5909f925d70776393b0d0c9cf47ce374f033667f
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3438 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: Running task 3439 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3440 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 086866da6f76a51a2961c2e4f6b900b27c4df15064c977c8818a3cf215cb3e64
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: recipe appstream-0.16.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-0.16.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3441 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: Running task 3442 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3443 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe appstream-0.16.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3444 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3445 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe appstream-0.16.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata unihash changed to d40286f7c4229a96b81fbfa8a6fde78072e9f63c061d4950811507eda6928064
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3446 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3447 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3448 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Succeeded
NOTE: Running task 3449 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3450 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata unihash changed to bada25f06d0b699871dde8d2690b35846039f7c2a01b2638c5ee43082dc7dc9e
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3451 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 55af2504360e414f25b6aa9c32663ce5f53165bee0becf7d88545412db71d0d5
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3452 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 3453 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3454 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile: Succeeded
NOTE: Running task 3455 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3456 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install: Started
NOTE: recipe bluez5-5.70-r0: task do_compile: Succeeded
NOTE: Running task 3457 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.70-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 3458 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3459 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 3460 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: Running task 3461 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3462 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_populate_sysroot)
NOTE: Running task 3463 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-0.16.3-r0: task do_compile: Succeeded
NOTE: Running task 3464 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_install)
NOTE: recipe appstream-0.16.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-0.16.3-r0: task do_install: Succeeded
NOTE: Running task 3465 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_package)
NOTE: Running task 3466 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_populate_sysroot)
NOTE: recipe appstream-0.16.3-r0: task do_package: Started
NOTE: recipe appstream-0.16.3-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-0.16.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-0.16.3-r0: task do_package: Succeeded
NOTE: Running task 3467 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_packagedata)
NOTE: recipe appstream-0.16.3-r0: task do_packagedata: Started
NOTE: recipe appstream-0.16.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_packagedata unihash changed to 75ea0827a7c699af1633be74d8466c31ced17064bfb66412ba20b662bb985dfe
NOTE: Setscene tasks completed
NOTE: Running task 3468 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_0.16.3.bb:do_create_spdx)
NOTE: recipe appstream-0.16.3-r0: task do_create_spdx: Started
NOTE: recipe appstream-0.16.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 3469 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_package: Succeeded
NOTE: Running task 3470 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata unihash changed to 6a37dc01a45fa41763ee6b0c677c21f34ed5bb8777c57c41596716688d2e3016
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_packagedata: Started
NOTE: Running task 3471 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_packagedata unihash changed to 03fe3b1895254cc6d89926fe4c23dab35af551acf7a2663f5f324543980f9a97
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3472 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3473 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_install)
NOTE: recipe bluez5-5.70-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_install: Succeeded
NOTE: Running task 3474 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.70-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.70-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3475 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot)
NOTE: Running task 3476 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_package)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.70-r0: task do_package: Started
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_package: Succeeded
NOTE: Running task 3477 of 3547 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata)
NOTE: recipe bluez5-5.70-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata: Failed
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3477 tasks of which 3250 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215101914.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215101914.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata
Summary: There were 51 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.71-r0 to 0:5.70-r0) [version-going-backwards]
ERROR: bluez5-5.70-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/bluez5/5.70/temp/log.do_packagedata.3127267
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata) failed with exit code '1'

--===============7102020086171201756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libadwaita: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.4/libadwaita-1.4.0.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.4/libadwaita-1.4.2.tar.xz;name=archive"
packages/core2-64-poky-linux/libadwaita: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 3890840 to 3894400 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PKGSIZE changed from 7900 to 7890 (-0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PKGSIZE changed from 7633 to 7956 (+4%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 7797725 to 7799464 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita: PV changed from "1.4.0" to "1.4.2"
packages/core2-64-poky-linux/libadwaita/libadwaita: PKGV changed from 1.4.0 [default] to 1.4.2 [default]

--===============7102020086171201756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.4.0-1.4.2.patch"

RnJvbSBjMWY1N2MxMDc5ZjlmMTViNzljZWE4YWZjMWZmYzIyMWJjYTZjODJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTA6MjE6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuNC4wIC0+IDEuNC4yCgotLS0KIC4uLi9saWJhZHdhaXRhL3ts
aWJhZHdhaXRhXzEuNC4wLmJiID0+IGxpYmFkd2FpdGFfMS40LjIuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuNC4wLmJiID0+IGxpYmFkd2Fp
dGFfMS40LjIuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGFfMS40LjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjQuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjQuMi5iYgppbmRleCBj
YzA1NzU2ODA1Li5lZGNmYmE1NGI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
YWR3YWl0YS9saWJhZHdhaXRhXzEuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS40LjIuYmIKQEAgLTExLDcgKzExLDcgQEAgREVQRU5EUyA9ICIg
XAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZh
bGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTUxYTA5
OGE1NGQ0MzU2ODIxOGZjNDhmY2Y1MmU4MGUzNmY0NjliM2NlOTEyZDhjZTljMzA4YTM3ZTlmNDdj
MiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjMzZmExNjc1NGU3MzcwYzg0MTc2NzI5
OGIzZmY1ZjIzMDAzZWUxZDI1MTVjYzJmZjI1NWU2NWVmM2Q0ZTg3MTMiCiAKIEFOWV9PRl9ESVNU
Uk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKLS0gCjIuNDIuMAoK

--===============7102020086171201756==--

