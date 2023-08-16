Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A092DC5ACA0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.174030.1692224344156108358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WufOeQXH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y3ExPGMH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a006e6d5b-ecb81ddd-61ad-4118-89ee-478ce367bd35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Bfr6FOTS2bJ/kbIDUcmChUfxsKA3XRikhYAaS5JJ9M=;
	b=WufOeQXHZanPK55kmgaidHFg62OLE+QMSQTorRkwHpLljwdd4I4h2dCkynZq3ucT
	P/WVCMG3FIfqR/OUrTK9Qg55gKT2CfHaQZqdEvRRQKMuCUbojs8A5RO49vqBmqfnkjO
	MgzNEFbXWrHeKP8LBAQraPynN+j5nAksn2JICy6A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Bfr6FOTS2bJ/kbIDUcmChUfxsKA3XRikhYAaS5JJ9M=;
	b=Y3ExPGMHcLrXR7WVmuso0+kIi4FbvJ2S6GQa6p+NIbLcbtkNP8LxdcsfoN9K9FS9
	XB5Tnx7myV+l9RYFCnxvFtrMDgdOA+q0cqfk8Nn1J7Ma7vxVSgAWdLXm/IAsmXOL5Jq
	rM8c8F+1v9a/co+cSXuHciyaVJVMP7UKzWjjnKbc=
Content-Type: multipart/mixed; boundary="===============3114581522333480114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.22.5 SUCCEEDED
Message-ID: <0101018a006e6d5b-ecb81ddd-61ad-4118-89ee-478ce367bd35-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186243

--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.22.4-1.22.5.patch
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
From dda571aca689b14b1bda2c71165df49f223fd500 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 18:17:38 +0000
Subject: [PATCH] gstreamer1.0-plugins-good: upgrade 1.22.4 -> 1.22.5

---
 ...ugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
index 0ae1758a3f..93f0e76ee9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "d7120c1146a9d723d53d5bfe8074da2575a81f0598438752937f39bb7c833b6a"
+SRC_URI[sha256sum] = "b67b31313a54c6929b82969d41d3cfdf2f58db573fb5f491e6bba5d84aea0778"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.39.2


--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-32 sysroot...done.
Removing 117 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0fef20962c8f7e975d9d0c7bc6ff2e84268467de"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 747 Local 695 Mirrors 0 Missed 52 Current 372 (93% match, 95% complete)
Removing 3 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 373 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 512 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1133 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_recipe_qa)
NOTE: Running task 1136 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 1140 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 1142 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 1143 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 1144 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 1145 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 1161 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1173 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: Running task 1186 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_write_config)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Started
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 528 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 529 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 538 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1210 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 1211 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 1212 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 1213 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_fetch)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1214 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1215 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 1216 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_fetch)
NOTE: Running task 1217 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1223 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running setscene task 540 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: Running task 1224 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 1225 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1226 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_unpack)
NOTE: Running task 1227 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 1228 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 1230 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_create_spdx_setscene)
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 1233 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 551 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 1235 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 561 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1236 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_patch)
NOTE: Running setscene task 565 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-base/1.22.4/temp/log.do_packagedata_setscene.993227
NOTE: Running setscene task 567 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 568 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_package_setscene)
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1243 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 1245 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_generate_toolchain_file)
NOTE: Running task 1246 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1247 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 1248 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1249 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1250 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 1251 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1252 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1253 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 596 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 600 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1259 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 620 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 622 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.57-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 1261 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1262 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.57-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 629 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.57-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 640 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 643 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.57-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 653 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic unihash changed to 354fd13810796c485100eead4056862536a53a844fd2be9e838396ac5fb1d7a6
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 665 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.57-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.57-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 670 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 693 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 698 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 728 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 795 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 887 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 893 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 899 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 905 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 913 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 916 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 940 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 945 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 950 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 966 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 983 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1004 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1043 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1045 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1050 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1057 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1062 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1069 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1071 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1083 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1086 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1088 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1096 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1106 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1110 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1112 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2725 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2726 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2783 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2784 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2785 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2787 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2846 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2912 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: Running task 2913 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2921 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2922 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_collect_spdx_deps)
NOTE: Running task 2924 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2926 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2929 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2930 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2931 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2933 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2934 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_configure)
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2937 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2938 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2939 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Succeeded
NOTE: Running task 2942 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2943 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Succeeded
NOTE: Running task 2944 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_populate_sysroot)
NOTE: Running task 2945 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_package)
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2946 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2947 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2948 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Succeeded
NOTE: Running task 2949 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2951 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_install)
NOTE: recipe speex-1.2.1-r0: task do_install: Started
NOTE: recipe speex-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2952 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_package)
NOTE: Running task 2953 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_package: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Succeeded
NOTE: Running task 2955 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_compile)
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2956 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 2957 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2958 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2959 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx)
NOTE: Running task 2960 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2961 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2962 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2963 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2964 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 2965 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx)
NOTE: recipe lame-3.100-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Succeeded
NOTE: Running task 2966 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_install)
NOTE: recipe mpg123-1.31.3-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2967 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_create_spdx: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2968 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2969 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_install: Succeeded
NOTE: Running task 2970 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_package)
NOTE: Running task 2971 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2972 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_package: Started
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe mpg123-1.31.3-r0: task do_package: Succeeded
NOTE: Running task 2974 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2975 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_create_spdx)
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2976 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_install: Succeeded
NOTE: Running task 2977 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_package)
NOTE: Running task 2978 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2979 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2980 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Succeeded
NOTE: Running task 2981 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2982 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2983 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 2985 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 2986 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package)
NOTE: Running task 2987 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 2988 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2989 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_spdx)
NOTE: Running task 2990 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 2991 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2992 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2993 of 2993 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2993 tasks of which 2871 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 104 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0fef20962c8f7e975d9d0c7bc6ff2e84268467de"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 143 Local 91 Mirrors 0 Missed 52 Current 1005 (63% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1051 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1058 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-base/1.22.4/temp/log.do_packagedata_setscene.805442
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1146 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_package_setscene)
NOTE: Running task 2473 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_recipe_qa)
NOTE: Running task 2536 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2604 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2641 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 2642 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2643 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2644 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Started
NOTE: Running task 2752 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_recipe_qa)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 2793 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: Running task 2866 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_write_config)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 2947 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_fetch)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: Running task 2948 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2949 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2950 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2951 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2952 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Started
NOTE: Running task 2953 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2954 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_fetch)
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Succeeded
NOTE: Running task 2955 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_unpack)
NOTE: Running task 2956 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: Running task 2957 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2958 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2959 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2960 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2961 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2962 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2963 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2964 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_unpack)
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 2965 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2966 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2967 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: Running task 2968 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2969 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2970 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2971 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 2972 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2973 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 2974 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: Running task 2975 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2976 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_collect_spdx_deps)
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2977 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_patch)
NOTE: Running task 2978 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: Running task 2979 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2980 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 2981 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2982 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2983 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2984 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2985 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2986 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2987 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Succeeded
NOTE: Running task 2988 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_generate_toolchain_file)
NOTE: Running task 2989 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2990 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2991 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 2992 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2993 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2994 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: Running task 2995 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2996 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic unihash changed to 354fd13810796c485100eead4056862536a53a844fd2be9e838396ac5fb1d7a6
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1148 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2998 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2999 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3010 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3013 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3015 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 3017 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 3018 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Succeeded
NOTE: Running task 3019 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3021 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Succeeded
NOTE: Running task 3022 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_install)
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Succeeded
NOTE: Running task 3023 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_populate_sysroot)
NOTE: Running task 3024 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_package)
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 3025 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_compile: Started
NOTE: Running task 3028 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3029 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3030 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe speex-1.2.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 3033 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe speex-1.2.1-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3034 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_package)
NOTE: Running task 3035 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3036 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_package: Started
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3038 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3039 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3041 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3045 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3046 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Succeeded
NOTE: Running task 3048 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_install)
NOTE: recipe mpg123-1.31.3-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx)
NOTE: recipe lame-3.100-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3050 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_install: Succeeded
NOTE: Running task 3051 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_package)
NOTE: Running task 3052 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_package: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3054 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_create_spdx)
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3055 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_package)
NOTE: Running task 3057 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3058 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3059 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Succeeded
NOTE: Running task 3060 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3061 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3062 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package)
NOTE: Running task 3066 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3068 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_spdx)
NOTE: Running task 3069 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3070 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3071 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3072 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3072 tasks of which 2950 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 104 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 18531020 to 18532104 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 12953063 to 12954415 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.4.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.5.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.22.4 [default] to 1.22.5 [default]

--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0fef20962c8f7e975d9d0c7bc6ff2e84268467de"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 143 Local 91 Mirrors 0 Missed 52 Current 989 (63% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1035 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1042 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1126 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2456 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_recipe_qa)
NOTE: Running task 2518 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2583 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2619 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2620 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 2621 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2622 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2721 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_recipe_qa)
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Started
NOTE: Running task 2752 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-base/1.22.4/temp/log.do_packagedata_setscene.643488
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1130 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_package_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: Running task 2798 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_fetch)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2799 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2800 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: Running task 2801 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2802 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2803 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2804 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2805 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_fetch)
NOTE: Running task 2833 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_write_config)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Succeeded
NOTE: Running task 2910 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 2911 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2912 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2913 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2914 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_unpack)
NOTE: Running task 2915 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2916 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2917 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2918 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2919 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2920 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_unpack)
NOTE: Running task 2921 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2922 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2923 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2924 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2925 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2926 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2927 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2928 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 2929 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: Running task 2930 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2931 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2932 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Succeeded
NOTE: Running task 2933 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_patch)
NOTE: Running task 2934 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2935 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 2936 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2937 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2938 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2939 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2940 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2941 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2942 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Succeeded
NOTE: Running task 2943 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_generate_toolchain_file)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2944 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2945 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 2946 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2947 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2948 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: Running task 2949 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2950 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2951 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2952 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic unihash changed to 354fd13810796c485100eead4056862536a53a844fd2be9e838396ac5fb1d7a6
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: Running task 2953 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1132 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2955 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2966 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2970 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2971 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2972 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2973 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Succeeded
NOTE: Running task 2974 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2975 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2976 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_populate_sysroot)
NOTE: Running task 2979 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_package)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2980 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Succeeded
NOTE: Running task 2981 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2982 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_create_spdx)
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2984 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2985 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speex-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2986 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_package)
NOTE: Running task 2987 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_package: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Succeeded
NOTE: Running task 2988 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_compile)
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2989 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2990 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2991 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe speex-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2992 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2993 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2994 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2997 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2998 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 2999 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3001 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Succeeded
NOTE: Running task 3002 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_install: Started
NOTE: recipe mpg123-1.31.3-r0: task do_install: Succeeded
NOTE: Running task 3003 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_package)
NOTE: Running task 3004 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_package: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3007 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx)
NOTE: recipe lame-3.100-r0: task do_create_spdx: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_package: Succeeded
NOTE: Running task 3008 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3009 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_create_spdx)
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_install: Succeeded
NOTE: Running task 3011 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_package)
NOTE: Running task 3012 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_package: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3013 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3014 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Succeeded
NOTE: Running task 3015 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3016 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3017 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3018 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package)
NOTE: Running task 3021 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3022 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_spdx)
NOTE: Running task 3024 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3025 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3026 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3027 of 3027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3027 tasks of which 2905 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 104 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0fef20962c8f7e975d9d0c7bc6ff2e84268467de"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 143 Local 91 Mirrors 0 Missed 52 Current 1005 (63% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1051 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1058 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2473 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_recipe_qa)
NOTE: Running task 2531 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2604 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2640 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2641 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2643 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2644 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: Running task 2752 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2790 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: Running task 2866 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_write_config)
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.22.4/temp/log.do_packagedata_setscene.491277
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1146 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_package_setscene)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2937 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_fetch)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2938 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2939 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: Running task 2940 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2941 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2942 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2943 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2944 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_fetch)
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: Running task 2955 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_unpack)
NOTE: Running task 2956 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2957 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: Running task 2958 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2959 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2960 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2961 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_unpack)
NOTE: Running task 2962 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2963 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2964 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2965 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 2966 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2967 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2968 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2969 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 2970 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2971 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2972 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2973 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 2974 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Succeeded
NOTE: Running task 2975 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_patch)
NOTE: Running task 2976 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2977 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2978 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2979 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_collect_spdx_deps)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2980 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 2981 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Started
NOTE: Running task 2982 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2983 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2984 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2985 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Succeeded
NOTE: Running task 2986 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_generate_toolchain_file)
NOTE: Running task 2987 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2988 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2989 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2990 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 2991 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2992 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2993 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2994 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2995 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Running task 2996 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic unihash changed to 354fd13810796c485100eead4056862536a53a844fd2be9e838396ac5fb1d7a6
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2997 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2998 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1148 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3000 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3011 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3015 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 3017 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 3018 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Succeeded
NOTE: Running task 3019 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Succeeded
NOTE: Running task 3020 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_install)
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3021 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Succeeded
NOTE: Running task 3022 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_populate_sysroot)
NOTE: Running task 3023 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_package)
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3024 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 3025 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Succeeded
NOTE: Running task 3027 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3028 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3029 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3030 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_install)
NOTE: recipe speex-1.2.1-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speex-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_package)
NOTE: Running task 3033 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_package: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3034 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3035 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 3036 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_compile)
NOTE: Running task 3037 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 3039 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3041 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3042 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Started
NOTE: Running task 3043 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3044 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3045 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 3046 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3047 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3048 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Succeeded
NOTE: Running task 3049 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_install)
NOTE: recipe mpg123-1.31.3-r0: task do_install: Started
NOTE: recipe mpg123-1.31.3-r0: task do_install: Succeeded
NOTE: Running task 3050 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_package)
NOTE: Running task 3051 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_package: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3052 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe mpg123-1.31.3-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3054 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_create_spdx)
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3055 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_package)
NOTE: Running task 3057 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3058 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3059 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Succeeded
NOTE: Running task 3060 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3061 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3062 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package)
NOTE: Running task 3066 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3068 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_spdx)
NOTE: Running task 3069 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3070 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3071 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3072 of 3072 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3072 tasks of which 2950 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 104 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3114581522333480114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0fef20962c8f7e975d9d0c7bc6ff2e84268467de"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 89 Mirrors 0 Missed 52 Current 1015 (63% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1060 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1067 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1150 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.22.4/temp/log.do_packagedata_setscene.339234
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1154 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_package_setscene)
NOTE: Running task 2493 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_recipe_qa)
NOTE: Running task 2551 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2624 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2660 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2661 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2662 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2664 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Started
NOTE: Running task 2772 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2810 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 2886 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_write_config)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2971 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2972 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2973 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2974 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2975 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2976 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2977 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Started
NOTE: Running task 2978 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_fetch)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: Running task 2979 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_unpack)
NOTE: Running task 2980 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2981 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2982 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: Running task 2983 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 2984 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Started
NOTE: Running task 2985 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2986 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2987 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2988 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2989 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2990 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2991 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2992 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Started
NOTE: Running task 2993 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 2994 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2995 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 2996 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2997 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2998 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: Running task 2999 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_patch)
NOTE: Running task 3000 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 3001 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 3002 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_collect_spdx_deps)
NOTE: Running task 3003 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Running task 3004 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: Running task 3005 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3006 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 3007 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3008 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3009 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 3010 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3011 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Started
NOTE: Running task 3012 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_generate_toolchain_file)
NOTE: Running task 3013 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3014 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3015 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: Running task 3016 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3017 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: Running task 3018 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3019 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 3020 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_configure)
NOTE: Running setscene task 1156 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa_setscene)
NOTE: Running task 3021 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_lic unihash changed to 354fd13810796c485100eead4056862536a53a844fd2be9e838396ac5fb1d7a6
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3033 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 3036 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3037 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_configure)
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3039 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3040 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 3041 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 3042 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_compile)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3045 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_install: Succeeded
NOTE: Running task 3047 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_populate_sysroot)
NOTE: Running task 3048 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_package)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 3049 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_package: Succeeded
NOTE: Running task 3050 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3051 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3052 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.55.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3053 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speex-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_install)
NOTE: recipe speex-1.2.1-r0: task do_install: Started
NOTE: recipe speex-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3055 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_package)
NOTE: Running task 3056 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_package: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe mpg123-1.31.3-r0: task do_configure: Succeeded
NOTE: Running task 3058 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3059 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 3060 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 3061 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3062 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3063 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3064 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3065 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3066 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx)
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3067 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3069 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3070 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_compile: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3071 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_install)
NOTE: recipe mpg123-1.31.3-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_package)
NOTE: Running task 3074 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx)
NOTE: recipe mpg123-1.31.3-r0: task do_package: Started
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 3076 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_compile)
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Started
NOTE: recipe mpg123-1.31.3-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_create_spdx)
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.31.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3079 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_install)
NOTE: recipe libsoup-3.4.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.2-r0: task do_install: Succeeded
NOTE: Running task 3080 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_package)
NOTE: Running task 3081 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_package: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3082 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_package: Succeeded
NOTE: Running task 3084 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3086 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3088 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3089 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package)
NOTE: Running task 3090 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_spdx)
NOTE: Running task 3093 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3094 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3095 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3096 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3096 tasks of which 2974 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 104 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.5-r0 to 0:1.22.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3114581522333480114==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.22.4-1.22.5.patch"

RnJvbSBkZGE1NzFhY2E2ODliMTRiMWJkYTJjNzExNjVkZjQ5ZjIyM2ZkNTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTg6MTc6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kOiB1cGdyYWRlIDEuMjIuNCAtPiAxLjIyLjUKCi0tLQog
Li4udWdpbnMtZ29vZF8xLjIyLjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIy
LjUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMjIuNC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEu
MjIuNS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjQuYmIgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjUuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yMi40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29v
ZF8xLjIyLjUuYmIKaW5kZXggMGFlMTc1OGEzZi4uOTNmMGU3NmVlOSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Rf
MS4yMi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIuNS5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdvb2QvZ3N0
LXBsdWdpbnMtZ28KICAgICAgICAgICAgZmlsZTovLzAwMDEtcXQtaW5jbHVkZS1leHQtcXQtZ3N0
cXRnbC5oLWluc3RlYWQtb2YtZ3N0LWdsLWdzdGdsZi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLXY0bDItRGVmaW5lLWlvY3RsX3JlcV90LWZvci1wb3NpeC1saW51eC1jYXNlLnBhdGNo
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDcxMjBjMTE0NmE5ZDcyM2Q1M2Q1YmZlODA3NGRh
MjU3NWE4MWYwNTk4NDM4NzUyOTM3ZjM5YmI3YzgzM2I2YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJiNjdiMzEzMTNhNTRjNjkyOWI4Mjk2OWQ0MWQzY2ZkZjJmNThkYjU3M2ZiNWY0OTFlNmJiYTVk
ODRhZWEwNzc4IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIAot
LSAKMi4zOS4yCgo=

--===============3114581522333480114==--

