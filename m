Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C0CEEEC23
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.29687.1694804395543139483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dm6CsumY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FOqLuCto;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a9a36c2b6-8f5f39aa-c0a5-40b1-9f23-d5f96f484d37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4VwQk8w3Pdieze70Hbld/tBZuafLdoEXtKhr7RUs1UI=;
	b=Dm6CsumY7RQctNiq1lZZSSTWumDU+8ZBXyjDf6RqBfcZkfqRkLbi/nixjpfnd43S
	f3WGXrBnXluQwv4XR2+zhhqVlDrBFNKsnYjYqtVbURQ2N0b6MttiGCVHvLObkBDtTO/
	Z5+O9He58jl0iHt0QNxUkHpaL602gZb7ZAu9NtYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4VwQk8w3Pdieze70Hbld/tBZuafLdoEXtKhr7RUs1UI=;
	b=FOqLuCtoprYqsFAuAczESlBE7andjDDEVNcYP7Hjn8/5IRVEzCaXBnaU7z+Y3tIY
	b+QbGmURbS0GTNoo7/cepkS7UX8o1WOEBlrcMwUky74gy1FdOU0Dfz6xdnN6XxK1WDz
	ccGpFOWOxcLkOPaJMHV4rMVuWeAosVVwZZyIHN94=
Content-Type: multipart/mixed; boundary="===============2679049001781074309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.3.5 SUCCEEDED
Message-ID: <0101018a9a36c2b6-8f5f39aa-c0a5-40b1-9f23-d5f96f484d37-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187744

--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libadwaita* to *1.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.3.4-1.3.5.patch
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
From 6e31a8899a8360f6e7bafed1083e47a241771aa2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 14:27:31 +0000
Subject: [PATCH] libadwaita: upgrade 1.3.4 -> 1.3.5

---
 .../libadwaita/{libadwaita_1.3.4.bb => libadwaita_1.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.3.4.bb => libadwaita_1.3.5.bb} (86%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb
similarity index 86%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb
index 2abc8d9f2f..d548fcc18a 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "801ccaf3a760213b59ebb9b8185327df225049544aee68a1340b165710acb1bd"
+SRC_URI[archive.sha256sum] = "faa3ff0f36db18ab4942f4904a295293ccb144755b9bb85131393f201926b586"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.39.2


--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1809 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-84d0f23d1972c971814054df5fc4cba0327f6c14"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84d0f23d1972c971814054df5fc4cba0327f6c14"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 24 Mirrors 0 Missed 181 Current 1006 (11% match, 85% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1178 of 1211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1210 of 1211 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1211 of 1211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libical-native-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1851 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2171 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2184 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 2218 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Running task 2249 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2278 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa)
NOTE: Running task 2300 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 2332 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 2333 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 2369 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 2376 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 2428 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 2429 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 2465 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa)
NOTE: Running task 2466 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 2467 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 2514 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: Running task 2545 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa)
NOTE: Running task 2546 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Started
NOTE: Running task 2547 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2548 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 2560 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: Running task 2575 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 2600 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 2601 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 2602 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2604 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2630 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: Running task 2633 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 2636 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2653 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: Running task 2674 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 2675 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2689 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: Running task 2693 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 2704 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2705 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: Running task 2729 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2734 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_recipe_qa)
NOTE: Running task 2737 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: Running task 2738 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: Running task 2739 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2740 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 2741 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: Running task 2742 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2743 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2744 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2745 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2746 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2761 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: Running task 2803 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2804 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 2805 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2816 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2817 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2818 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2819 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 2820 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2821 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2822 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 2823 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2824 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2841 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2844 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2849 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2850 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2851 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: Running task 2857 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2861 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: Running task 2869 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2889 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2890 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: Running task 2891 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: Running task 2892 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 2893 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2894 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2895 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2896 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2897 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 2898 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: Running task 2899 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2900 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2901 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2902 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2903 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: Running task 2904 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Started
NOTE: Running task 2905 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: Running task 2906 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2907 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2908 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2909 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2910 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2911 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 2912 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2913 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: Running task 2914 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2915 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2916 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2917 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2918 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: Running task 2919 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: Running task 2920 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2921 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2922 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2923 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 2924 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2925 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2926 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: Running task 2927 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_fetch)
NOTE: Running task 2928 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2929 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 2930 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2931 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: Running task 2932 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2933 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: Running task 2934 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: Running task 2935 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2936 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2937 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2938 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2939 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2940 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2941 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 2942 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 2943 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2944 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 2945 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 2946 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 2947 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2948 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2949 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 2950 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2951 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_unpack)
NOTE: Running task 2952 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 2953 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 2954 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2955 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2956 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2957 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: Running task 2958 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2959 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: Running task 2960 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 2961 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2962 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2963 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 2964 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2965 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2966 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2967 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: Running task 2968 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: Running task 2969 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2970 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2971 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2972 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2973 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2974 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2975 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2976 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 2977 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2978 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2979 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2980 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 2981 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2982 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: Running task 2983 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: Running task 2984 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2985 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2986 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_patch)
NOTE: Running task 2987 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2988 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2989 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2990 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2991 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2992 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2993 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 2994 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Started
NOTE: Running task 2995 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 2996 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2997 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2998 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: Running task 2999 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3000 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3001 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 3002 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3003 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: Running task 3004 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3005 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 3006 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5b28f4df3b7a45811ba331aec74ee1e0153bfdd8dbe8eb7a349a0da3250c4fef
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3026 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Started
NOTE: Running task 3034 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3035 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3036 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3037 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic unihash changed to f4658c55f8142c90fdbe5cea79bcff8ef93c869b7c9a70eb2d72eccdb4e18cdb
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3038 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3039 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3040 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3041 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 3042 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3043 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3044 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3045 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3046 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3047 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3048 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: Running task 3049 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3050 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3051 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 3052 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Started
NOTE: Running task 3053 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3054 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 3055 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3056 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to bbd9eabba2f33064b48fb5e4dcfe60a80e24085bebcd82aaeb2bc06e214d6d13
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 19ac5db2bb096dedf1bf71eb5ab2ed31e474b7bc5f51b96586203e12d29148c4 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'e5fd86ed4184af39269852ff6a881fc2008addbc38a0155b5a7affb5b1f549dd', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '19ac5db2bb096dedf1bf71eb5ab2ed31e474b7bc5f51b96586203e12d29148c4'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed e5fd86ed4184af39269852ff6a881fc2008addbc38a0155b5a7affb5b1f549dd -> 19ac5db2bb096dedf1bf71eb5ab2ed31e474b7bc5f51b96586203e12d29148c4 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3070 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3073 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3074 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: Running task 3075 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: Running task 3076 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3077 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3079 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3080 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 3081 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3082 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3083 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3084 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3086 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: Running task 3088 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3089 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3090 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3091 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3092 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3093 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3094 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3095 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: Running task 3096 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3097 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3098 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3099 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3100 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3102 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3103 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3104 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3105 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 3106 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3107 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: Running task 3109 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: Running task 3110 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: Running task 3111 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3112 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3113 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3115 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3116 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3117 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3118 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3120 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3121 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 3122 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3123 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3124 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: Running task 3125 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3126 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3127 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3128 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 3130 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3131 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3132 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: Running task 3133 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3134 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3135 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3136 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3137 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3138 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3139 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3140 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3141 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3142 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3143 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3144 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 3145 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3146 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3147 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3148 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3149 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3150 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3151 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3152 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3153 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3154 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3155 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3156 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3157 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3158 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3159 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3160 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3161 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3162 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3163 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3164 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3165 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3166 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3167 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3168 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3169 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3170 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3171 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: Running task 3172 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3173 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3174 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3175 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3176 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3177 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3178 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3179 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: Running task 3180 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3181 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3182 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3183 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3184 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3186 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3187 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3188 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3189 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3190 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3191 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3192 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3193 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3194 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3198 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3199 of 3280 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3199 tasks of which 2859 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.8/temp/log.do_packagedata.870028
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-84d0f23d1972c971814054df5fc4cba0327f6c14"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84d0f23d1972c971814054df5fc4cba0327f6c14"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 211 Local 30 Mirrors 0 Missed 181 Current 992 (14% match, 84% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1044 of 1203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1171 of 1203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1203 of 1203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1851 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2163 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2176 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 2198 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Running task 2229 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 2256 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa)
NOTE: Running task 2280 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 2312 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 2313 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 2349 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 2356 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 2408 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa)
NOTE: Running task 2409 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 2444 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 2445 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 2447 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 2494 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: Running task 2525 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 2526 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2527 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa)
NOTE: Running task 2528 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 2540 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: Running task 2555 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2579 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: Running task 2584 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 2585 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2587 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 2610 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2611 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2614 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: Running task 2615 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: Running task 2616 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 2619 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2636 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: Running task 2653 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 2658 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2659 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 2673 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: Running task 2675 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: Running task 2676 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2677 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2678 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2683 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: Running task 2684 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 2685 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: Running task 2686 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2687 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2689 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2695 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2705 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2726 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_recipe_qa)
NOTE: Running task 2729 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2730 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 2731 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2732 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2733 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: Running task 2734 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: Running task 2735 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: Running task 2736 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2737 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2738 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2739 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2740 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2741 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2742 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2743 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: Running task 2744 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: Running task 2745 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 2746 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2747 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 2748 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2749 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 2750 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2751 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2752 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2753 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2754 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2755 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: Running task 2756 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2757 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2758 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2759 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2760 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2761 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2762 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2763 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 2764 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: Running task 2765 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: Running task 2766 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2767 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2768 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: Running task 2769 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 2774 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2775 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running task 2776 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: Running task 2777 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 2778 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2779 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_fetch)
NOTE: Running task 2780 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2791 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2794 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: Running task 2795 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2796 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2797 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2798 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 2807 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2808 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: Running task 2809 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2810 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: Running task 2811 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2812 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 2813 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 2814 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 2815 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d0ef6662ae372fa27fc72347367b49c49f9a3fa83629e8c158b959f0b7205cdd
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2833 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: Running task 2834 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2837 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: Running task 2838 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2840 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2841 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2842 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2843 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2849 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2882 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: Running task 2890 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2891 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2908 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2909 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2911 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_write_config)
NOTE: Running task 2922 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: Running task 2923 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2924 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: Running task 2927 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2932 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2933 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2937 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2938 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2939 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 2941 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2942 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2943 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2951 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2952 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: Running task 2953 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2954 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Started
NOTE: Running task 2955 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2956 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2957 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Running task 2958 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2959 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2960 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2961 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2962 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2963 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2964 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2965 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 2966 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2967 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2968 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2969 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2970 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2972 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2979 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2980 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2981 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2982 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_patch)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2983 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2984 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2985 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2986 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2987 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2988 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 2989 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2990 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2991 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 2992 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2993 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx)
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2994 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2995 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2996 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: Running task 2997 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2998 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2999 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: Running task 3000 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3001 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3003 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: Running task 3005 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Started
NOTE: Running task 3006 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3007 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3008 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3009 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3010 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3012 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3013 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3014 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: Running task 3015 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3017 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3018 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 3019 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 3020 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 47494d9e181fcc292c328be9c9d3307004fa465e0edc79a25fb3affe9de5dbf5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 356402cac6b40f0440776dcb0a577d3ac97d3da89e62629b8598f86e800a0d8d to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '07021513cba0530b09cfcb9772eb3752206193f4b095ea82a5e6901987809199', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '356402cac6b40f0440776dcb0a577d3ac97d3da89e62629b8598f86e800a0d8d'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 07021513cba0530b09cfcb9772eb3752206193f4b095ea82a5e6901987809199 -> 356402cac6b40f0440776dcb0a577d3ac97d3da89e62629b8598f86e800a0d8d as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3034 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Started
NOTE: Running task 3037 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3038 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3039 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: Running task 3040 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic unihash changed to f4658c55f8142c90fdbe5cea79bcff8ef93c869b7c9a70eb2d72eccdb4e18cdb
NOTE: Running task 3041 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3042 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: Running task 3043 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3044 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3045 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3046 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3047 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 3048 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3049 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_collect_spdx_deps)
NOTE: Running task 3050 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3051 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3052 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_create_spdx)
NOTE: Running task 3053 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3055 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: Running task 3056 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: Running task 3057 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 3059 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3060 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3061 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3062 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3063 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3064 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3065 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3066 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3067 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3068 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 3069 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: Running task 3070 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3071 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: Running task 3072 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3074 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3075 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3076 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3077 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: Running task 3078 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3079 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3080 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3081 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: Running task 3083 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: Running task 3085 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3086 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3087 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3088 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3090 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3091 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3092 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3095 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3097 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3098 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3099 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3101 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3102 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3103 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3104 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3105 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3106 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3107 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3109 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3110 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3112 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3113 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3116 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3117 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3118 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3119 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3120 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3121 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3122 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3123 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3124 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3125 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3126 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3127 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3128 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3130 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3131 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3132 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3133 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3134 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3135 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3136 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3137 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: Running task 3138 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: Running task 3139 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3140 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3141 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3142 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3143 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3144 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: Running task 3145 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3146 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3147 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3148 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3149 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3150 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3152 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3153 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3156 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3157 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3158 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3159 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3160 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3162 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3163 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3164 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3165 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3166 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3167 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3168 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: Running task 3169 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3170 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3171 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3174 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3176 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3177 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3177 tasks of which 2835 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.8/temp/log.do_packagedata.1306783
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============2679049001781074309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.3.4-1.3.5.patch"

RnJvbSA2ZTMxYTg4OTlhODM2MGY2ZTdiYWZlZDEwODNlNDdhMjQxNzcxYWEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTQ6Mjc6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuMy40IC0+IDEuMy41CgotLS0KIC4uLi9saWJhZHdhaXRhL3ts
aWJhZHdhaXRhXzEuMy40LmJiID0+IGxpYmFkd2FpdGFfMS4zLjUuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuMy40LmJiID0+IGxpYmFkd2Fp
dGFfMS4zLjUuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjMuNC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGFfMS4zLjUuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjMuNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjMuNS5iYgppbmRleCAy
YWJjOGQ5ZjJmLi5kNTQ4ZmNjMThhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
YWR3YWl0YS9saWJhZHdhaXRhXzEuMy40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS4zLjUuYmIKQEAgLTExLDcgKzExLDcgQEAgREVQRU5EUyA9ICIg
XAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZh
bGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiODAxY2Nh
ZjNhNzYwMjEzYjU5ZWJiOWI4MTg1MzI3ZGYyMjUwNDk1NDRhZWU2OGExMzQwYjE2NTcxMGFjYjFi
ZCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImZhYTNmZjBmMzZkYjE4YWI0OTQyZjQ5
MDRhMjk1MjkzY2NiMTQ0NzU1YjliYjg1MTMxMzkzZjIwMTkyNmI1ODYiCiAKIEFOWV9PRl9ESVNU
Uk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKLS0gCjIuMzkuMgoK

--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-32 sysroot...done.
Removing 138 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-84d0f23d1972c971814054df5fc4cba0327f6c14"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84d0f23d1972c971814054df5fc4cba0327f6c14"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 763 Local 601 Mirrors 0 Missed 162 Current 431 (78% match, 86% complete)
Removing 3 stale sstate objects for arch qemux86...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 7 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 466 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 468 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 593 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 635 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 638 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 658 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 662 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 665 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 701 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 706 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 707 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 708 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 738 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 748 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 749 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 754 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1150 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1153 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe harfbuzz-8.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1182 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1185 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 1198 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa)
NOTE: Running task 1213 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1224 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1225 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1232 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package_setscene: Started
NOTE: Running task 1235 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1252 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa)
NOTE: Running task 1253 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 1264 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_recipe_qa)
NOTE: Running task 1265 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.48.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1276 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1277 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1321 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1322 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa)
NOTE: Running task 1323 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1324 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running setscene task 764 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1329 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1338 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1339 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 1340 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1346 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1363 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 1376 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: Running setscene task 772 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 774 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running task 1398 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 1399 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1408 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: Running setscene task 777 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: Running setscene task 779 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_recipe_qa: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 782 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 786 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 788 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Started
NOTE: Running setscene task 790 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 797 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 799 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 802 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: Running setscene task 803 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_recipe_qa unihash changed to c85934a1964225b42b9daa36f2ae5e87cffd8ea02815bd3e767366f6e45c227b
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: Running setscene task 796 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 811 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1414 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 1415 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1416 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 1418 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1419 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: Running task 1420 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1421 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 1422 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 1423 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 1424 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 827 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1440 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 1441 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_fetch)
NOTE: Running task 1442 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 1443 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1444 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1446 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 1447 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 1448 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 1449 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1455 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 1456 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 1457 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1458 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1459 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1468 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1469 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1472 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: Running task 1497 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_write_config)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: Running setscene task 833 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 835 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 840 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1534 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: Running task 1535 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1536 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 1537 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1539 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: Running task 1540 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe iso-codes-4.15.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 852 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1541 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running setscene task 853 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 855 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running setscene task 858 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1558 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 867 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1569 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1570 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 1571 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_unpack)
NOTE: Running task 1572 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 1573 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 1574 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1575 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 1576 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 1577 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 1578 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 868 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: Running task 1580 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 871 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 873 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: Running task 1586 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 875 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1587 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running setscene task 881 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 1628 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1629 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1630 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 1631 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1634 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: Running task 1635 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: Running setscene task 887 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: Running task 1641 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 890 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1644 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 892 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: Running task 1650 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1651 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1652 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running setscene task 896 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 897 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running setscene task 899 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 901 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1653 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running setscene task 903 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 904 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running setscene task 906 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1655 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1656 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1657 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 1658 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 1659 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 1660 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 911 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 915 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1667 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1668 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1669 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 1670 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running setscene task 916 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 919 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 922 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 928 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 930 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package_setscene)
NOTE: Running task 1671 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 933 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: Running task 1673 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running setscene task 940 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 943 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_package_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1711 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 946 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1712 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 948 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 955 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 956 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: Running task 1721 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1725 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1726 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 957 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 959 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 965 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1733 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1734 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1735 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 1736 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1737 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1738 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: Running task 1739 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1740 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1741 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1742 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 1743 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 966 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1749 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 1750 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1752 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 970 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 972 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1764 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1765 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: Running task 1766 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1767 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 1773 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: Running task 1785 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 973 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 976 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 981 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 986 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 1786 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1787 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1788 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 1789 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1790 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 987 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 989 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Started
NOTE: Running task 1791 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1792 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1793 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 1795 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1806 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 991 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package_setscene)
NOTE: Running task 1812 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1813 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1814 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 998 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 1816 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1817 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic unihash changed to f4658c55f8142c90fdbe5cea79bcff8ef93c869b7c9a70eb2d72eccdb4e18cdb
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_package_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1010 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1019 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1020 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1021 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1025 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1031 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1033 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1035 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_deploy_source_date_epoch unihash changed to d15907c3d703925c65979b30f32f60f477cd39f05cc23584ff371291ee24defc
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1017 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1018 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1021 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1034 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1042 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1049 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1052 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1054 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1853 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1062 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1854 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1071 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1073 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1076 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running task 1866 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1081 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1083 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1085 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1878 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1090 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: Running setscene task 1092 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1096 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1100 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1879 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1102 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1905 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: Running task 1906 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: Running setscene task 1108 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1951 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1111 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1116 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1126 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1128 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1132 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1133 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1140 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running setscene task 1145 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1147 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 2004 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1154 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1156 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 85b839d498dd1ce3f45c2bfcf46dab21cfbbb5a924a734c1d92f1e8f6abc858f
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 089c7b0f3f48178e6769a4452f744efe03f02d46e79b1f0120db93f863886050 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'c375adef1e46c50ef8bfd329ebe1b4ac8acd265207f709e967a1cce7b3bce126', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '089c7b0f3f48178e6769a4452f744efe03f02d46e79b1f0120db93f863886050'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed c375adef1e46c50ef8bfd329ebe1b4ac8acd265207f709e967a1cce7b3bce126 -> 089c7b0f3f48178e6769a4452f744efe03f02d46e79b1f0120db93f863886050 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1165 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1175 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2032 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_compile)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1184 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1185 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_compile: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 2051 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe iso-codes-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2052 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1188 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1189 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 2062 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2063 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1192 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1194 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2517 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2612 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2620 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2638 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 2720 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2765 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2803 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2804 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2818 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2819 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2860 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2861 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2866 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2902 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2928 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: Running task 2931 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: Running task 2942 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2943 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2948 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2949 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2950 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: Running task 2959 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2960 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2961 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 31b247ebdb7eba35fe8dc4d738e9c9dbdbb24b394abee1f0d4bd8e6b4c45013a
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2983 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2984 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 2986 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2993 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2994 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2995 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 2996 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2997 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: Running task 3003 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3009 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3010 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3011 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3012 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3013 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3014 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3015 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3016 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3018 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx)
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3020 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3022 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 3023 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3025 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3026 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3027 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3028 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3029 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3030 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3031 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3032 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3033 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 3044 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3045 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3048 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3050 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3051 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3052 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: Running task 3053 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3054 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: Running task 3055 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 3056 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3058 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3059 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3060 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3061 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3062 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3063 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3064 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: Running task 3065 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3066 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3069 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3070 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: Running task 3071 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3072 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3073 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3074 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3076 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3077 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3078 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3080 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: Running task 3081 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3082 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3083 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3084 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3086 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3087 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3088 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3089 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3090 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3091 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 3092 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_populate_sysroot)
NOTE: Running task 3093 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_package)
NOTE: recipe iso-codes-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_package: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_populate_sysroot unihash changed to b2a13d9cda1a62413139f3c3bf59778e2b8c0721bac96a230a5db4a13f272e5d
NOTE: Setscene tasks completed
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3094 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3097 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3099 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3100 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3101 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3102 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3103 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3104 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3105 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3106 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3107 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3110 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3111 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3112 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: Running task 3114 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3115 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3117 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3118 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3119 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3120 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3121 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 3122 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3123 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3124 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3125 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3126 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3127 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3128 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3130 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3131 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3132 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3133 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3134 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3135 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3136 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3137 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3138 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: Running task 3139 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3140 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3141 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3142 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3143 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3144 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3145 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3146 of 3224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3146 tasks of which 2825 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.8/temp/log.do_packagedata.1475426
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-84d0f23d1972c971814054df5fc4cba0327f6c14"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84d0f23d1972c971814054df5fc4cba0327f6c14"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 30 Mirrors 0 Missed 175 Current 982 (14% match, 85% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1034 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1155 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1187 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1839 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2163 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2185 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Running task 2216 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 2244 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa)
NOTE: Running task 2267 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 2299 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 2300 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 2336 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 2343 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 2395 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa)
NOTE: Running task 2428 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 2430 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa)
NOTE: Running task 2431 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 2478 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: Running task 2507 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2508 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 2509 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 2510 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa)
NOTE: Running task 2522 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: Running task 2558 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 2559 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2560 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 2564 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 2582 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 2585 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2588 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2595 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2606 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: Running task 2618 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: Running task 2619 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 2629 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2630 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2644 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 2645 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 2650 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2658 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2659 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: Running task 2670 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2676 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2680 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: Running task 2681 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2693 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_recipe_qa)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2696 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: Running task 2697 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 2698 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2713 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2716 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2756 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2757 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2758 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: Running task 2759 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2760 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2761 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: Running task 2762 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2763 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 2764 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2765 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2766 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2767 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 2768 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2769 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: Running task 2770 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2771 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2772 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 2773 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2774 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2775 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2776 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: Running task 2777 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2778 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2779 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2780 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2781 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2782 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2783 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2784 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2785 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2786 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2787 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 2788 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2789 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 2790 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: Running task 2791 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 2792 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: Running task 2793 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: Running task 2794 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2795 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2796 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_fetch)
NOTE: Running task 2797 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2804 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2805 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2806 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2807 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 2808 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 2809 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2810 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: Running task 2811 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2812 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2813 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2814 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: Running task 2831 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2843 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2844 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2846 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: Running task 2852 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 2853 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2854 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2855 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 2865 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: Running task 2866 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2867 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: Running task 2868 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2869 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2880 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2881 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 2882 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_unpack)
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Started
NOTE: Running task 2883 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9493080bb9803e924e9207643fec480cf0b240db3a3e6063b46080b85022abf3
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 2899 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2900 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2903 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: Running task 2906 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2907 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2908 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2909 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2910 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: Running task 2912 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2913 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2914 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 2915 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2922 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2923 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: Running task 2924 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2925 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: Running task 2926 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: Running task 2927 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2928 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: Running task 2929 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: Running task 2930 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: Running task 2931 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2932 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2933 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2934 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: Running task 2935 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2936 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2937 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2938 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2939 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2940 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2941 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 2942 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2944 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 2945 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2946 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2947 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 2948 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2949 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: Running task 2950 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2951 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2952 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2953 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2954 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2955 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2956 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2957 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2958 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2959 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_patch)
NOTE: Running task 2960 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 2961 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2962 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 2963 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2964 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2965 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2966 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2967 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2968 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: Running task 2969 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2970 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2971 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2972 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2973 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2974 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2975 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2976 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic)
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2977 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 2978 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Running task 2979 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5c46eaaea9a95ec3cdfae4336e00821ada1f410bba53862e1d7f98f1b5ab10f8
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 9f99abfb5b7b314da6eff1882376128992c19a578323dfdea0a1390d93e8df05 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '9ae68fde206bb3e91a2ea242402461c0657e79c7c86154264958ae483d168f75', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '9f99abfb5b7b314da6eff1882376128992c19a578323dfdea0a1390d93e8df05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 9ae68fde206bb3e91a2ea242402461c0657e79c7c86154264958ae483d168f75 -> 9f99abfb5b7b314da6eff1882376128992c19a578323dfdea0a1390d93e8df05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2981 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2985 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: Running task 2986 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2997 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2999 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic unihash changed to f4658c55f8142c90fdbe5cea79bcff8ef93c869b7c9a70eb2d72eccdb4e18cdb
NOTE: Running task 3001 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3002 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: Running task 3003 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: Running task 3004 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 3005 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Started
NOTE: Running task 3006 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3007 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3008 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: Running task 3009 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 3010 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3011 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3012 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3013 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_create_spdx)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3014 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3015 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3018 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: Running task 3019 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 3020 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3022 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3023 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3024 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3025 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3026 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3027 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 3028 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3029 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3030 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3031 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3032 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3033 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: Running task 3034 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3035 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3036 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3037 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3038 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3041 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3042 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3043 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3044 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3045 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3046 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: Running task 3047 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3048 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3049 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 3050 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3051 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3052 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3053 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 3054 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3056 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3057 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3059 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3060 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3061 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3062 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: Running task 3063 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3064 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3065 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3066 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3068 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: Running task 3069 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3072 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3073 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3074 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3075 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: Running task 3077 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3078 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3079 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3080 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3081 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3082 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3083 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3084 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3085 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3086 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3087 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3088 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3089 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3090 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3091 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3094 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3096 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3098 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3099 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3100 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3102 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3103 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3104 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3105 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3106 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3107 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3109 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3110 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3111 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3112 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3115 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3116 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3117 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3118 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3119 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3120 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3121 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3122 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3123 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3124 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3125 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3126 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3127 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3128 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3129 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3130 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3131 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3132 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3133 of 3211 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3133 tasks of which 2805 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.8/temp/log.do_packagedata.1161399
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-84d0f23d1972c971814054df5fc4cba0327f6c14"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84d0f23d1972c971814054df5fc4cba0327f6c14"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 211 Local 30 Mirrors 0 Missed 181 Current 992 (14% match, 84% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1044 of 1203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1171 of 1203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1203 of 1203 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1851 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2163 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2176 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 2198 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2229 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 2256 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa)
NOTE: Running task 2280 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 2312 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 2313 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 2349 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 2356 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 2408 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 2409 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa)
NOTE: Running task 2444 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa)
NOTE: Running task 2445 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 2446 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 2494 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: Running task 2525 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa)
NOTE: Running task 2526 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 2527 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2528 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 2540 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2555 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: Running task 2579 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 2580 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2584 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 2585 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 2610 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 2613 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2614 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2620 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Started
NOTE: Running task 2633 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 2635 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 2656 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 2657 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2670 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2672 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2677 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2678 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 2679 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: Running task 2680 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2683 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2684 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2690 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2691 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: Running task 2721 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_recipe_qa)
NOTE: Running task 2724 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: Running task 2725 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2733 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 2734 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2735 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2743 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: Running task 2762 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 2763 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: Running task 2787 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2788 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2796 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2797 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2798 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2799 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 2800 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2801 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2802 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 2803 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: Running task 2804 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2805 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2806 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2807 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2808 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2809 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2810 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2811 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 2812 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: Running task 2813 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2814 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 2815 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2816 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2817 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2818 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2819 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2820 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 2821 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2822 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2823 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2824 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 2825 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: Running task 2826 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2827 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 2828 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: Running task 2829 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2830 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 2831 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2832 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2833 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2834 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2835 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2836 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2837 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2838 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: Running task 2839 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_fetch)
NOTE: Running task 2840 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2841 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2842 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2843 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2845 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2858 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2859 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 2860 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: Running task 2861 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2862 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: Running task 2863 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2868 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_write_config)
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2881 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: Running task 2882 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2883 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: Running task 2891 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 2892 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2893 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 2894 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2895 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2896 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 2897 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 2898 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: Running task 2899 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_unpack)
NOTE: Running task 2900 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 2901 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2902 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 2903 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 2904 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bbed31d8c22a06808d37b4890d92fb48e12c87ded35bea0d18c00e01704fdf4b
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2914 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: Running task 2923 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2924 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2925 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2928 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2929 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2930 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: Running task 2931 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2933 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2934 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 2941 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 2942 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2943 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2944 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2945 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 2946 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2947 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: Running task 2948 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 2949 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2960 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 2967 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2968 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2969 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 2970 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2971 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2972 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2973 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2974 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 2975 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2976 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2977 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2978 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 2979 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2980 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2981 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2983 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2985 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2986 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 2987 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2988 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: Running task 2989 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch)
NOTE: Running task 2990 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2991 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2992 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2993 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2994 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2995 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2996 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libadwaita-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2997 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2998 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2999 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3000 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3001 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: Running task 3002 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 3003 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3004 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.116-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3005 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3007 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3008 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 3009 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3010 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Started
NOTE: Running task 3011 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3012 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3013 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: Running task 3014 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3015 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3016 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 3017 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3018 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 74767825f4c36d5bdaa875783dc6b2eb411b129256d8a55c59fc108cf1e64ed1
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash e758259479f1e0cb269bc19e38ea79741ff9cdddc8a2b2d024b087a119f35153 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '4aeaf3f49343e557e295dc4fd9e707d3575daf79350ec783e141b86073fbff0d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'e758259479f1e0cb269bc19e38ea79741ff9cdddc8a2b2d024b087a119f35153'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4aeaf3f49343e557e295dc4fd9e707d3575daf79350ec783e141b86073fbff0d -> e758259479f1e0cb269bc19e38ea79741ff9cdddc8a2b2d024b087a119f35153 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3023 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3034 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3036 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: Running task 3037 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libadwaita-1.3.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.3.5.bb:do_populate_lic unihash changed to f4658c55f8142c90fdbe5cea79bcff8ef93c869b7c9a70eb2d72eccdb4e18cdb
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3038 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3039 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libadwaita-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3041 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: Running task 3042 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3043 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3044 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: Running task 3045 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3046 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3047 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 3048 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3049 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3050 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3051 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3052 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3053 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.4.bb:do_create_spdx)
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3054 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: Running task 3056 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3057 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: Running task 3059 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 3060 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.4-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3061 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3062 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3063 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3064 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3065 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3066 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 3067 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: Running task 3068 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3069 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: Running task 3070 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3071 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3072 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3074 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: Running task 3075 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: Running task 3076 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3077 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3078 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3079 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3081 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3082 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3084 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3085 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3086 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-8.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3087 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3088 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3090 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3091 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 3092 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3094 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3096 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: Running task 3097 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: Running task 3098 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3099 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3101 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3102 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3103 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: Running task 3104 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3105 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3106 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3107 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 3109 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3110 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3111 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3112 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3114 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3115 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: Running task 3116 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3117 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3118 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3119 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3120 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3121 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3122 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3123 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3124 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3125 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3126 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3127 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3128 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3130 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3131 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3132 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3133 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3134 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3135 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3136 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3137 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3138 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3139 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3140 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3141 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3142 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3143 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3144 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3145 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3146 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3147 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3148 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3149 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3150 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3152 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3153 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: Running task 3154 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3156 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3157 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3158 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3159 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3160 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3162 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3163 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3164 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3165 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3166 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3167 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3168 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3169 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3170 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3171 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3174 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3176 of 3256 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3176 tasks of which 2835 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.8/temp/log.do_packagedata.1021434
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============2679049001781074309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.3/libadwaita-1.3.4.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.3/libadwaita-1.3.5.tar.xz;name=archive"
packages/core2-32-poky-linux/libadwaita: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-es: PKGSIZE changed from 6468 to 6628 (+2%)
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-src: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 6365880 to 6374511 (+0%)
packages/core2-32-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libadwaita/libadwaita: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libadwaita/libadwaita: PKGV changed from 1.3.4 [default] to 1.3.5 [default]

--===============2679049001781074309==--

