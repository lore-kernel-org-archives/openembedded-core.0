Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA76C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2256.1783489333676243297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rqbKX9ZM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zQ6DwgcL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f403f8630-85e430b5-e7cf-4b04-982c-72dcd4f61fc8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489332;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=/WbVhWrIXHnm0lMR3xzx88cOEn4TH/UkyhfTkGKCs2s=;
	b=rqbKX9ZM5wuPwJByWXEVD/dfNHsVUN5XJpZkf3WUc3UPxIbHV0yLiZKnNruTAsiq
	kA7Z3fJGquYTVaHTZp38LXJGGZuEtsnAQXrSnExL3ZaGwurCN1ET1H4W6MDBrfCRoGP
	jFL1pbmbFn9JclT0s6b8R1GSJs1x3kM3KWA9qJHg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489332;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=/WbVhWrIXHnm0lMR3xzx88cOEn4TH/UkyhfTkGKCs2s=;
	b=zQ6DwgcLts7+iqZKLjezstkOhZKyJ/k7dr7tmZjm4UFI2K6xiAVGUxidYq4ZfIU0
	cpMPfIy46tnPF43IZZV+bMTOWeeWS7fNL8Bv2HSD3qvvNi4ZGcstjM8lBlnedqp1zWu
	8Pz/PpG0m0IYCWVhVrJJw4ZUNoA9THMsPFXCr9nc=
Content-Type: multipart/mixed; boundary="===============1861814827359349248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.24 SUCCEEDED
Message-ID: <0101019f403f8630-85e430b5-e7cf-4b04-982c-72dcd4f61fc8-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240433

--===============1861814827359349248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.23-21.1.24.patch
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
From fcf64aa3124137c47cd3e5d83646af401deed700 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:31:55 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.23 -> 21.1.24

---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 4a5bf4ba43..14831b1a9b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
+From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
index d3c00e087e..8d7f9ae14d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
+SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.47.1


--===============1861814827359349248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-028a7278598edd63f7936dde904ae31fe9e78fa0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:028a7278598edd63f7936dde904ae31fe9e78fa0"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 787 Local 568 Mirrors 0 Missed 219 Current 236 (72% match, 78% complete)
done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 314 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_populate_lic_setscene)
NOTE: Running setscene task 366 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 453 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 502 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_populate_lic_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glslang-native-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 507 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 529 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 532 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 533 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 541 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe glslang-native-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 546 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_recipe_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 549 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-mako-native-1.3.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 573 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 612 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 619 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cmake-native-4.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 620 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cmake-native-4.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 622 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 630 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 650 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 683 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 693 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 698 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 700 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 701 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 703 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 709 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 725 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 730 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 738 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 748 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 754 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 755 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 761 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-4.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 764 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cmake-native-4.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 767 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 776 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 781 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 785 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 789 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 793 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 799 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 801 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 805 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 809 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 813 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 819 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 820 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 826 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 834 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 835 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 836 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 845 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 846 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 847 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 850 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 856 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 863 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 869 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 872 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 873 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 876 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 878 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 881 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 883 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 885 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 886 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 887 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 888 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 893 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 894 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 898 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 900 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 399 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_fetch)
NOTE: Running task 419 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 448 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_write_config)
NOTE: Running task 456 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: Running task 466 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_fetch)
NOTE: Running task 470 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 910 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.25.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_write_config: Started
NOTE: Running setscene task 914 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 915 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 946 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_write_config: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 958 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 968 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running task 931 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: Running task 941 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 953 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 960 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 981 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 987 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 973 of 1023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Started
NOTE: Running task 994 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1101 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Succeeded
NOTE: Running task 1102 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1143 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 992 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1146 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1150 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Started
NOTE: Running task 1163 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe mesa-2_26.1.4-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1177 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe wayland-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe wayland-1.25.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1000 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1004 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1008 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1010 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1214 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1215 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1283 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_write_config)
NOTE: Running task 1289 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1300 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_recipe_qa)
NOTE: Running task 1301 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1302 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Started
NOTE: recipe libevdev-1.13.6-r0: task do_recipe_qa: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: Running task 1377 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1521 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1522 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Running task 1525 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1541 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_recipe_qa)
NOTE: recipe libxml2-2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe libinput-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1542 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: Running task 1543 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_patch)
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Succeeded
NOTE: Running task 1544 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_unpack)
NOTE: recipe libevdev-1.13.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1545 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_fetch)
NOTE: Running task 1551 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_fetch)
NOTE: Running task 1552 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: recipe libevdev-1.13.6-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Started
NOTE: Running task 1553 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1554 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libinput-1.31.3-r0: task do_fetch: Started
NOTE: Running task 1557 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_configure)
NOTE: recipe libxml2-2.15.3-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1559 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Started
NOTE: Running task 1712 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe mtdev-1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1713 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_unpack)
NOTE: Running task 1714 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Succeeded
NOTE: Running task 1715 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.7-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Running task 1716 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1717 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1719 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_patch)
NOTE: Running task 1764 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1765 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: Running task 1783 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1784 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1785 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1788 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa)
NOTE: Running task 1789 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1790 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_recipe_qa)
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1791 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe mtdev-1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_deploy_source_date_epoch unihash changed to f3d1e3d981c7f0fb2485fc57a0c9d084abd9357ba2b33d8473c480d27bddc176
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1792 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_configure)
NOTE: Running task 1793 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa)
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1795 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe mtdev-1.1.7-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1796 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_fetch)
NOTE: Running task 1797 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_unpack)
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1799 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1800 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1801 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_patch)
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Started
NOTE: Running task 1802 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1804 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1806 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_fetch)
NOTE: Running task 1807 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_configure)
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1808 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_configure)
NOTE: recipe libevdev-1.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 1809 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 1810 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1811 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.6-r0: task do_patch: Started
NOTE: recipe libinput-1.31.3-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1812 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_unpack)
NOTE: recipe libevdev-1.13.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.6-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.31.3-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_deploy_source_date_epoch unihash changed to 1993f478a1a41a7897d46e8862c81ca327af4fd9ded46c766c05f728ca34f056
NOTE: Setscene tasks completed
NOTE: Running task 1815 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_configure)
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1818 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_write_config)
NOTE: recipe libevdev-1.13.6-r0: task do_configure: Started
NOTE: recipe libinput-1.31.3-r0: task do_write_config: Started
NOTE: recipe libinput-1.31.3-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1819 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_patch)
NOTE: recipe libinput-1.31.3-r0: task do_write_config: Succeeded
NOTE: Running task 1820 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_unpack)
NOTE: recipe libinput-1.31.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1821 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.31.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1822 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1825 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libinput-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe mesa-2_26.1.4-r0: task do_write_config: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 1831 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Started
NOTE: Running task 1832 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1833 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe libinput-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_unpack: Started
NOTE: Running task 1834 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_unpack)
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1835 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_patch)
NOTE: recipe mesa-2_26.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_patch)
NOTE: Running task 1839 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_compile)
NOTE: recipe mesa-2_26.1.4-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1842 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_recipe_qa)
NOTE: recipe libtirpc-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1864 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running task 1866 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: Running task 1867 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_recipe_qa: Succeeded
NOTE: recipe mesa-2_26.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1868 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_fetch)
NOTE: Running task 1869 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_install)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_26.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch unihash changed to dba4d95a3635e241ddf01349573d5e3f37365454ea38716bc5a0698eae658687
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch unihash changed to bec0867a35b00bdbc2776e51597e355d46d45eb5512bfa4fbc8ff5c0171193e6
NOTE: recipe libpciaccess-0.19-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1872 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 1873 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_write_config)
NOTE: Running task 1874 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1875 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx)
NOTE: Running task 1880 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_unpack)
NOTE: Running task 1887 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Succeeded
NOTE: Running task 1888 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch unihash changed to 73ef7617d8e634b19d88bc5cabd2585171c160ce0bfd7b99e35dda346481012c
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 1890 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1894 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_unpack: Succeeded
NOTE: Running task 1895 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_patch)
NOTE: recipe libtirpc-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 768734c914a9cda24ac3510ea224a4bc589223647e25cfdf7c10c5a14b3c9bfa
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1896 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot)
NOTE: Running task 1897 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package)
NOTE: Running task 1898 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure)
NOTE: Running task 1899 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.19-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch unihash changed to 28eb9c0403c27c4d5be8b76bc92736541b1da1f52131c98d555efc6152260faf
NOTE: recipe libtirpc-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: Running task 1902 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_write_config)
NOTE: recipe mtdev-1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_compile)
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1904 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 1905 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_patch)
NOTE: Running task 1906 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe mtdev-1.1.7-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot unihash changed to 79fbfeb7a907fd2549ebca186dcbbca52b3c3c800c7e2026799f010faadfb1f8
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_configure)
NOTE: Running task 1911 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to ec751883fbd326e2d74ddeca50be717f5f56476ee96cc9ddf63df151618448bf
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1912 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1913 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1914 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_unpack)
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1915 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.15.3-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_configure: Started
NOTE: Running task 1916 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_configure_ptest_base)
NOTE: Running task 1917 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1918 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_configure)
NOTE: Running task 1919 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_compile)
NOTE: recipe libpciaccess-0.19-r0: task do_package: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package unihash changed to 9f263513cd6894bbd6fdcd5b5ff809c08bfb581eea64d39b28544064ca337d74
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata became valid
NOTE: recipe mtdev-1.1.7-r0: task do_compile: Succeeded
NOTE: Running setscene task 1019 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: Running task 1920 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_install)
NOTE: Running task 1922 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.7-r0: task do_install: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1942 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: Running task 1943 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe mtdev-1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1947 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1949 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_configure)
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1950 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx)
NOTE: Running task 1952 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1953 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_compile)
NOTE: Running task 1954 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_install)
NOTE: Running task 1960 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx)
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_install)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_compile: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Started
NOTE: Running task 1962 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_install)
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_install)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1965 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1967 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 33556d13f1a7fb89098e60b90dd22eeb121abc4357398a30b7a8e0de2f4404a2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Succeeded
NOTE: Running setscene task 1019 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running task 1968 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot)
NOTE: Running task 1969 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_populate_sysroot)
NOTE: Running task 1970 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package)
NOTE: Running task 1971 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_package)
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1972 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1974 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Started
NOTE: Running task 1975 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1976 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: Running task 1977 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_populate_sysroot unihash changed to d2e36941bcdc3e000d14856a67eb28b13a0ab93e5bd758d5c13d958fe984d83c
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.6-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot unihash changed to 59dde7d522c87a52ca594308fab46de556a94291044ffe7d7abad4cc951ca204
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot unihash changed to 526577525632b41b2fcd0f51724b2f888d22e9d6f7ab4f221f1017c1cc830140
NOTE: Setscene tasks completed
NOTE: Running task 1978 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1979 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1980 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_compile)
NOTE: Running task 1981 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1982 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_compile)
NOTE: Running task 1983 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: Running task 1985 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_package)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.6-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: Running task 1987 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot unihash changed to 11a20f34a4eea0ceb8fb0bce969a34b67a95a9d25d38e0b7d35034df2fb8bdcd
NOTE: Running task 1990 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_install)
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_package unihash changed to e00410552fc7a8125f68a4ed94057870a3f95a9c7b85fd1dcd4ef050195b9d2b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_packagedata became valid
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Started
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1992 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1996 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_install: Started
NOTE: Running task 1997 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: Running task 1998 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package)
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package unihash changed to 33c45fba9a833e75ad16f14b70116639bf85aef3ffb321d1001838aa5a9b0ca4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: Running setscene task 1022 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running task 1999 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package unihash changed to 1416203fe87de3a6c66cbdc5f2c58703a994735bbe23faf176387ed2069081e8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Started
NOTE: Running setscene task 1022 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.6-r0: task do_compile: Succeeded
NOTE: Running task 2002 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_recipe_qa)
NOTE: Running task 2003 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot unihash changed to e28674662461a6078e4d3a9565f86ed4cecf26513bf296e50730e17895e1ff57
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.6-r0: task do_install: Started
NOTE: Running task 2006 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_recipe_qa)
NOTE: Running task 2007 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_recipe_qa)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2009 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_recipe_qa)
NOTE: recipe libdrm-2.4.134-r0: task do_install: Succeeded
NOTE: Running task 2010 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2011 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2012 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_recipe_qa)
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_recipe_qa: Started
NOTE: recipe libdrm-2.4.134-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2013 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package unihash changed to 0c5790ad6bd61e1a3ee5e38b7b50663447d9c76eb117081eff929263571bb232
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 2014 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_fetch)
NOTE: Running task 2015 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_fetch)
NOTE: Running task 2016 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_fetch)
NOTE: Running task 2017 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_fetch)
NOTE: recipe libevdev-1.13.6-r0: task do_install: Succeeded
NOTE: Running task 2018 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2019 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_fetch)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2021 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_write_config)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot unihash changed to 40bfa6bb094a648a699cd4d5b7a53d50a5037e07c6d9d0688435771da10b2276
NOTE: recipe rgb-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2033 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_package)
NOTE: Running task 2040 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx)
NOTE: Running task 2041 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2042 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2043 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_unpack)
NOTE: Running task 2046 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Started
NOTE: Running task 2047 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_patch)
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_patch: Succeeded
NOTE: Running task 2055 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.3-r0: task do_compile: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx)
NOTE: Running task 2058 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_compile_ptest_base)
NOTE: Running task 2062 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2063 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2064 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2065 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_install: Started
NOTE: Running task 2072 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package unihash changed to d686f76b351d73398d6f820434c32dbb1fdbc8a73ea570a41cf29c8781be6c18
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata became valid
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running task 2082 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_package)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2083 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.6-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_package: Started
NOTE: Running task 2084 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: Running task 2085 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2086 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2088 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_26.1.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.15.3-r0: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2089 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_install_ptest_base)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe libxml2-2.15.3-r0: task do_install_ptest_base: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch unihash changed to e8db76f24d125526e93c1d1b53646de8a5301a1b825badd2abb1e9444622560b
NOTE: recipe mesa-2_26.1.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2091 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_unpack)
NOTE: Running task 2092 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_unpack)
NOTE: Running task 2093 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2094 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch)
NOTE: Running task 2102 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_recipe_spdx)
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_package: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 2103 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package unihash changed to f941e41340c4385af7448903dc4a8e2333b1525df57a095c5106458a4f79a7ee
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata became valid
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Started
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata_setscene)
NOTE: Running task 2104 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c7a865d07183a6b64018052809ef7a46457c12e25e2878514e67f2b588e85833
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch unihash changed to 6bf13d04571f1c77fa01f68f3442caf5d89a46d36953df7c3da0180718cdaf48
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Started
NOTE: Running task 2106 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_patch)
NOTE: Running task 2116 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_create_spdx)
NOTE: Running task 2118 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 2119 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2120 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2121 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: Running task 2122 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_install)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2128 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Succeeded
NOTE: Running task 2134 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.7-r0: task do_install: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2135 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_write_config)
NOTE: Running task 2136 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch unihash changed to dcbce7eb9109c264cd1459d3c74a5c07dbddcf4d8881caf9bdaeb92806768510
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_deploy_source_date_epoch unihash changed to 63a6da1139e68eca4589691c443ea756f665cc08fbec132565fdf8a0446d4695
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to d0530dd11638228566a800a8ed9bfe284e440148c29186e517deba76699bff6a
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2137 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2138 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2139 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2140 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: Running task 2143 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_spdx)
NOTE: Running task 2144 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx)
NOTE: recipe libtirpc-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2145 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_configure: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_configure: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2146 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_package)
NOTE: Running task 2147 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_compile)
NOTE: Running noexec task 2148 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_configure)
NOTE: Running task 2149 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libtirpc-1.3.7-r0: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Started
NOTE: Running task 2150 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_configure)
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2151 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_configure)
NOTE: Running task 2152 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running noexec task 2153 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_compile)
NOTE: Running task 2154 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_configure: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_install: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx: Succeeded
NOTE: Running task 2157 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2169 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe mtdev-1.1.7-r0: task do_package: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata)
NOTE: Running task 2171 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2172 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.6-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to 1d3dbc10ae9e653473845c2ced61bb2f116f2797e60f901f8bcd3c1b046d10cf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running task 2174 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_recipe_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2175 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_recipe_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata unihash changed to ba0aaeee7b682d91e1cb182a9a39d3dc7274ff3afa1533b19c619e316abb65d0
NOTE: recipe libevdev-1.13.6-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2177 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_recipe_spdx)
NOTE: Running task 2178 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx)
NOTE: Running task 2185 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2189 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2210 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2211 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_spdx)
NOTE: Running task 2213 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb:do_create_recipe_spdx)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2216 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2217 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2218 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_create_recipe_spdx)
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2219 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_compile)
NOTE: Running task 2220 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe xserver-xorg-2_21.1.24-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2223 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_recipe_spdx)
NOTE: Running task 2224 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_populate_sysroot)
NOTE: recipe libevdev-1.13.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2225 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libevdev-1.13.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2226 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_create_spdx)
NOTE: recipe mtdev-1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2227 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_create_recipe_spdx)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2228 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_install)
NOTE: recipe libinput-1.31.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2230 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2231 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_recipe_spdx)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Started
NOTE: Running task 2232 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_install)
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libevdev-1.13.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2233 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_populate_sysroot)
NOTE: recipe libinput-1.31.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2234 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_create_recipe_spdx)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2237 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_packagedata)
NOTE: Running task 2239 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe rgb-1_1.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_package)
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata: Started
NOTE: Running task 2242 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata: Started
NOTE: Running task 2243 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.3-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2244 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2245 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 2246 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2247 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_spdx)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata unihash changed to 464e0db075e531540bd79cc2f1bc901be7c4563a9636ec731b7883b2b79165b4
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata unihash changed to f845b38bd2dcb1146955b08664c0f273e8928fdb2acb0dbd16c57e6204059eb8
NOTE: Setscene tasks completed
NOTE: Running task 2248 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx)
NOTE: Running task 2249 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_spdx)
NOTE: Running task 2250 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx: Started
NOTE: Running task 2251 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb)
NOTE: Running task 2252 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2253 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_qa)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2254 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2255 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot unihash changed to 9bc7c695c324e92be3ff4328883e4dfb11d016b4501ce881874b2a72d0aed1ae
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Succeeded
NOTE: Running task 2256 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2257 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package)
NOTE: Running task 2258 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb unihash changed to 7c0dbe5e88d3489fb33ae8a7c0ef782946c2dbdbf3eb79314841cc2aaf090838
NOTE: Running task 2259 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm)
NOTE: Running task 2260 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_qa unihash changed to f3245d1ef9b247f3ba27f0f019b851b7216066d735c7f76fc3051f14349d4c58
NOTE: Setscene tasks completed
NOTE: Running task 2261 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa)
NOTE: recipe wayland-1.25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Started
NOTE: Running task 2262 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm unihash changed to 9ddfb953180c94c5e6cbff9f803241b01860ea1845916d62e49288f69c9b0500
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk unihash changed to bf34cb1fc2d6b642addabbce6c84569917546ca6b58ec6541454b941333a2b58
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk unihash changed to 6334594f1d853b06ad627c1d9e435d90deb86c2537e866e387300a87982dae32
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb unihash changed to 0b39167839dee693cfcc6f00efc0830858f1b20c45794ee4b1b43f6374766d49
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa unihash changed to 9a6eddc6d4937f58df9df61621fce784583c83fe600c0e861b46041aae983446
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2263 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot unihash changed to 83a643c577a4227a88f3b029cfb9115876b487e8d1d7b570524903b1a6025fa1
NOTE: Setscene tasks completed
NOTE: Running task 2264 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_configure)
NOTE: Running task 2265 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm unihash changed to 179afad2055a20e4372f6f30e2fefe80efea90374986955262676c1bf19ac7db
NOTE: recipe wayland-1.25.0-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Succeeded
NOTE: Running task 2266 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot)
NOTE: Running task 2267 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot unihash changed to c73eeaf762b941ed585dff6699046d72f79900d1fe4579254ccff42049ac3aac
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot unihash changed to 664e2d0b5edae3c8c93aab1c438471fe0cf3bc6cc18a97b135e38501e41fa881
NOTE: Setscene tasks completed
NOTE: Running task 2268 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2269 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2270 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_configure)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2271 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_compile)
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_compile: Started
NOTE: Running task 2272 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_compile)
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2273 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_install)
NOTE: recipe rgb-1_1.1.1-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package)
NOTE: Running task 2275 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package unihash changed to e880d75b4310a990075745dc7ad649f338c6079fa2028c6109b1fd25daee8d6f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata became valid
NOTE: recipe rgb-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package: Started
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package unihash changed to 5c0ed031d697aff848c1d553432519fb0d88417aafc41d6a6ebb64c72ab49584
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata became valid
NOTE: recipe wayland-1.25.0-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running task 2276 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_configure_ptest_base)
NOTE: Running task 2278 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2279 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_install)
NOTE: recipe wayland-1.25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2280 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2282 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Started
NOTE: recipe wayland-1.25.0-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package unihash changed to 6353be1b4069a06e742b784cd7c49aaefd959e495479d78c69bc2733b0b5023b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata became valid
NOTE: Running setscene task 1023 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2283 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2284 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_spdx)
NOTE: Running task 2287 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_ipk)
NOTE: Running task 2288 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_deb)
NOTE: Running task 2289 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_rpm)
NOTE: Running task 2290 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_qa)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_ipk: Started
NOTE: recipe wayland-1.25.0-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_deb: Started
NOTE: Running task 2291 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_qa: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2292 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_install)
NOTE: recipe wayland-1.25.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2293 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_qa: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_install: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_qa unihash changed to 2a8790e71226a64fac2a8999610df792d98694cf831105a9dd9728863bc2e6d4
NOTE: Running task 2294 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_install_ptest_base)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_ipk unihash changed to 47d03163ff3c356251d353c5ffca89c4a1a6a658f3d0c634da96a86efab7948e
NOTE: recipe wayland-1.25.0-r0: task do_install_ptest_base: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe rgb-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2296 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_create_spdx)
NOTE: Running task 2297 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_write_ipk)
NOTE: Running task 2298 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_write_deb)
NOTE: recipe wayland-1.25.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2299 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot)
NOTE: Running task 2301 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_qa)
NOTE: recipe rgb-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_deb: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_deb: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_qa: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_deb unihash changed to 1a7dcfa5c71a75d841b40d3708ed297ab8f673498e5b65d412b7c28f615a5dcd
NOTE: recipe rgb-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_rpm unihash changed to d1a299b8b7c04c40d61ee3dc839626ae792acdf7d522e100752819a2b95b2f0e
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot unihash changed to f4fcfa65e3fd7d86bf2092a46889babb8b3cd441edd0e1a5f54761f06fe2b2c8
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_qa unihash changed to 6a3ffe7928ea7097e09abb725317cb01ffe088c825a48097de68a0a5c331fc95
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2302 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2303 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata unihash changed to 40dd3f6cb5ad2896be46588aa5f87031dde7236c77483c3edbd3aea59a4a1e39
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_configure)
NOTE: Running task 2305 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_spdx)
NOTE: Running task 2306 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_ipk)
NOTE: Running task 2307 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_deb)
NOTE: Running task 2308 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_rpm)
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa)
NOTE: Running task 2310 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 2311 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_compile)
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot unihash changed to 81b1622671620cee723d5cb64f80bc876f84c171ee1c1fcd00682b4fda93a2e8
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa unihash changed to f0d6e7c4f3f6df5650c9f3446bd797340d99c27280ea86be1f842ebd4082f0f1
NOTE: Setscene tasks completed
NOTE: Running task 2313 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libinput-1.31.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_compile: Started
NOTE: recipe libinput-1.31.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_configure)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Failed
NOTE: recipe libinput-1.31.3-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: recipe libinput-1.31.3-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_compile: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2315 tasks of which 1932 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260708053111.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260708053111.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxfont2/2.0.7/temp/log.do_packagedata.3037401
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2-src went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2-dbg went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2-staticdev went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2-dev went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2-doc went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2-locale went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: QA Issue: Package version for package libxfont2 went backwards which would break package feeds (from 0:2.0.8-r0 to 0:2.0.7-r0) [version-going-backwards]
ERROR: libxfont2-2.0.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxfont2/2.0.7/temp/log.do_packagedata.3037401
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata) failed with exit code '1'

--===============1861814827359349248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.23-21.1.24.patch"

RnJvbSBmY2Y2NGFhMzEyNDEzN2M0N2NkM2U1ZDgzNjQ2YWY0MDFkZWVkNzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNTozMTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjIzIC0+IDIxLjEuMjQKCi0tLQogLi4uMS14Zjg2cGNp
QnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIHwgMiAr
LQogLi4uL3t4c2VydmVyLXhvcmdfMjEuMS4yMy5iYiA9PiB4c2VydmVyLXhvcmdfMjEuMS4yNC5i
Yn0gICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci97eHNl
cnZlci14b3JnXzIxLjEuMjMuYmIgPT4geHNlcnZlci14b3JnXzIxLjEuMjQuYmJ9ICg5MiUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJk
d2FyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJk
d2FyLnBhdGNoCmluZGV4IDRhNWJmNGJhNDMuLjE0ODMxYjFhOWIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1
cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZw
Y2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGZlYzJhM2M4OTIyZWU3NTI2ZDU5ZTlmYTJjNmFkMDk0MzAxOGI3
YjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQzODc1ODAxOTRlOTFhZDczZjg5NmE5
NjY5NzU3NjEyYzg2MDFjOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYWxpZm9y
bmlhIFN1bGxpdmFuIDxjYWxpZm9ybmlhLmwuc3VsbGl2YW5AaW50ZWwuY29tPgogRGF0ZTogRnJp
LCAxNiBNYXIgMjAxOCAxNzoyMzoxMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSB4Zjg2cGNpQnVz
LmM6IHVzZSBJbnRlbCBkZHggb25seSBmb3IgcHJlLWdlbjQgaGFyZHdhcmUKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjMu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4x
LjI0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjQuYmIKaW5k
ZXggZDNjMDBlMDg3ZS4uOGQ3ZjlhZTE0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4yMy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjI0LmJiCkBAIC0xLDcg
KzEsNyBAQAogcmVxdWlyZSB4c2VydmVyLXhvcmcuaW5jCiAKIFNSQ19VUkkgKz0gIiBmaWxlOi8v
MDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2Fy
LnBhdGNoIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzOTgzMmU1NjE3ZGFkYWYwNzJmZGY5ZjBl
MTllNWQyZTFjMmExMzYwN2FjMjgwYmFjMWFiYTlmOGZlMTQ2MzQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMWE0ZWIzNmNhNjVjYzNiMWI5MzY1NjZkNjc3YTk3ODZlMTNjMTFjZDU4MDZlOTUxYWM1
NWYzZjVjZTM5ODRhZiIKIAogIyBUaGVzZSBleHRlbnNpb25zIGFyZSBub3cgaW50ZWdyYXRlZCBp
bnRvIHRoZSBzZXJ2ZXIsIHNvIGRlY2xhcmUgdGhlIG1pZ3JhdGlvbgogIyBwYXRoIGZvciBpbi1w
bGFjZSB1cGdyYWRlcy4KLS0gCjIuNDcuMQoK

--===============1861814827359349248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.23.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.24.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
packages/x86-64-v3-poky-linux/xserver-xorg: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18739016 to 18739248 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: FILELIST: directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/utils/gtf -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/utils/gtf, directory renamed /usr/src/debug/xserver-xorg/21.1.23/fb -> /usr/src/debug/xserver-xorg/21.1.24/fb, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/xkb -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/bus -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/bus, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dixmods -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dixmods, directory renamed /usr/src/debug/xserver-xorg/21.1.23/include -> /usr/src/debug/xserver-xorg/21.1.24/include, directory renamed /usr/src/debug/xserver-xorg/21.1.23/miext/damage -> /usr/src/debug/xserver-xorg/21.1.24/miext/damage, directory renamed /usr/src/debug/xserver-xorg/21.1.23/dri3 
 -> /usr/src/debug/xserver-xorg/21.1.24/dri3, directory renamed /usr/src/debug/xserver-xorg/21.1.23/mi -> /usr/src/debug/xserver-xorg/21.1.24/mi, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/exa -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.23/composite -> /usr/src/debug/xserver-xorg/21.1.24/composite, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/x86emu -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.23/Xext -> /usr/src/debug/xserver-xorg/21.1.24/Xext, directory renamed /usr/src/debug/xserver-xorg/21.1.23/miext/shadow -> /usr/src/debug/xserver-xorg/21.1.24/miext/shadow, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/vgahw -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/vgahw, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/x86emu/x86emu -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/x86
 emu/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.23/config -> /usr/src/debug/xserver-xorg/21.1.24/config, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dri -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri, directory renamed /usr/src/debug/xserver-xorg/21.1.23/randr -> /usr/src/debug/xserver-xorg/21.1.24/randr, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/drivers/modesetting -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/drivers/modesetting, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/fbdevhw -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/fbdevhw, directory renamed /usr/src/debug/xserver-xorg/21.1.23/dix -> /usr/src/debug/xserver-xorg/21.1.24/dix, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/shadowfb -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/shadowfb, directory renamed /usr/src/debug/xserver-xorg/21.1.23/Xi -> /usr/src/debug/xserver-xorg/21.1.24/Xi, directory renamed /usr/
 src/debug/xserver-xorg/21.1.23/os -> /usr/src/debug/xserver-xorg/21.1.24/os, directory renamed /usr/src/debug/xserver-xorg/21.1.23/record -> /usr/src/debug/xserver-xorg/21.1.24/record, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/linux -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/linux, directory renamed /usr/src/debug/xserver-xorg/21.1.23/glamor -> /usr/src/debug/xserver-xorg/21.1.24/glamor, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/int10 -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/int10, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/common -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/common, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/ramdac -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/ramdac, directory renamed /usr/src/debug/xserver-xorg/21.1.23/damageext -> /usr/src/debug/xserver-xorg/21.1.24/damageext, directory renamed /usr/src/debug/xserver-xorg/21.1.2
 3/miext/sync -> /usr/src/debug/xserver-xorg/21.1.24/miext/sync, directory renamed /usr/src/debug/xserver-xorg/21.1.23/xkb -> /usr/src/debug/xserver-xorg/21.1.24/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.23/exa -> /usr/src/debug/xserver-xorg/21.1.24/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dri2/pci_ids -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri2/pci_ids, directory renamed /usr/src/debug/xserver-xorg/21.1.23/glx -> /usr/src/debug/xserver-xorg/21.1.24/glx, directory renamed /usr/src/debug/xserver-xorg/21.1.23/render -> /usr/src/debug/xserver-xorg/21.1.24/render, directory renamed /usr/src/debug/xserver-xorg/21.1.23/xfixes -> /usr/src/debug/xserver-xorg/21.1.24/xfixes, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/drivers/inputtest -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/drivers/inputtest, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dri2 -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree
 86/dri2, directory renamed /usr/src/debug/xserver-xorg/21.1.23/present -> /usr/src/debug/xserver-xorg/21.1.24/present, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/glamor_egl -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/glamor_egl, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/shared -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/shared, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/modes -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/modes, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/loader -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/loader, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/misc -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/misc, directory renamed /usr/src/debug/xserver-xor
 g/21.1.23/dbe -> /usr/src/debug/xserver-xorg/21.1.24/dbe, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/parser -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/parser, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/i2c -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/i2c, directory renamed /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/ddc -> /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/ddc
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11885261 to 11886934 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.23 [default] to 21.1.24 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.23" to "21.1.24"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.23 [default] to 21.1.24 [default]

--===============1861814827359349248==--

