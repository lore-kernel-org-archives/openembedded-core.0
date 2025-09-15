Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9836CCA472
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.30881.1757937273072046775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=us8MuXSA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BF+cmch7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101994d3a60ad-a24fcecc-c295-47e8-abe9-9c013fe31218-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=87Cq35UkeXNfSsSL15IbgXGpj8Ksd+aPRQbiQuv7UWw=;
	b=us8MuXSAfl9ILrfJ9ykyu60AFqwiQnK+JGC2+eXZHJnYapnHKPhuhGRtMz0huHAk
	CWNk/RkFeWirre3+KYdqXHoa9i/WY5NY0TOr5G2d0Nu+fqPab8nwQoXhCftY6tnYeLj
	tBhG6bzdnOte6ZYWIbFinmsye6sXr1bbbo655aiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=87Cq35UkeXNfSsSL15IbgXGpj8Ksd+aPRQbiQuv7UWw=;
	b=BF+cmch7Nu+CuEh5GeQZADCPdEqjYqh4IUzCpPPjsGATF3I5RQsQZAW0UlBrBL9U
	6exGdaVGVx+Z+osx2gAs/UPqs5v6WtBkcYMeEtn4NJJrscC6XOH5FFqC+SsnbtA9Pet
	yaaRI0zTzaa6GqM5Wru9/ZekLPDjSfZ6DY4ncr/8=
Content-Type: multipart/mixed; boundary="===============0759600467012984570=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 2376227855422b01ed36a1c9fa83739fce96053d
 SUCCEEDED
Message-ID: <010101994d3a60ad-a24fcecc-c295-47e8-abe9-9c013fe31218-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223474

--===============0759600467012984570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *2376227855422b01ed36a1c9fa83739fce96053d* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From 0143aa9c495b0d5d0f0e9f7a9285333283ab47fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:18:14 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 91b5740df3..350a3d142e 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "a7c7826bce5cbb9b9c337c11b9b7f8b278e76fba"
+SRCREV = "2376227855422b01ed36a1c9fa83739fce96053d"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.47.1


--===============0759600467012984570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 21986056 to 21986616 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles (['= 2:0.0+git0+2376227855-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3865943 to 3867160 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles-dev (['= 2:0.0+git0+2376227855-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855

--===============0759600467012984570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 108 recipes from the qemux86_64 sysroot...done.
Removing 108 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a49373d67d61e933a22e56c46a20f9ec41d281b4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a49373d67d61e933a22e56c46a20f9ec41d281b4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 865 Local 849 Mirrors 0 Missed 16 Current 400 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 444 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 501 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 514 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_package_setscene)
NOTE: Running setscene task 525 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 559 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 592 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 602 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 645 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running task 1417 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1620 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1621 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1622 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 694 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.56.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1635 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 738 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 741 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: Running setscene task 742 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: Running task 1656 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe mesa-2_25.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 747 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 776 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 778 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 781 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 789 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 805 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 808 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 818 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 824 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 841 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 842 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 845 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 848 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe clang-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 856 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 864 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe clang-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 871 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 873 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 882 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 884 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 894 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 897 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 903 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 905 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 906 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 916 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 917 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libpng/1.6.48/temp/log.do_packagedata_setscene.1683919
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 918 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 920 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_package_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 925 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 931 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 932 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 935 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1832 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1900 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1901 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 953 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 954 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 956 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 957 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 978 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 981 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 982 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 995 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1000 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1004 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1006 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1007 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1008 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1010 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1021 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1022 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1024 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1029 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1038 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1044 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1949 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1051 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1053 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1062 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1063 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1979 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1990 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1073 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1074 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1079 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1996 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe clang-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe clang-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1109 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1113 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1122 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1124 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1126 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1136 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1139 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1142 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1146 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1147 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1149 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1152 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1156 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1158 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1160 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1167 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1168 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1174 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1176 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1184 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1189 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1192 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1194 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1198 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1200 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1203 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1205 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1207 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1209 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1210 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1211 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1215 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1218 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1222 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1223 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1225 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1226 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1229 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1231 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1233 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2277 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1237 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1238 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1245 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1246 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1247 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1252 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1255 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2347 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1260 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1262 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 847649e8416434eec9711c10b4b8e32a04e431bdaefc8356263efc83c8e64efd to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a937c9a627425a8bd55ec61e4a0709d75fbb2be788a1e4a603f77e999c30c887', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '847649e8416434eec9711c10b4b8e32a04e431bdaefc8356263efc83c8e64efd'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a937c9a627425a8bd55ec61e4a0709d75fbb2be788a1e4a603f77e999c30c887 -> 847649e8416434eec9711c10b4b8e32a04e431bdaefc8356263efc83c8e64efd as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2943 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2966 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 847649e8416434eec9711c10b4b8e32a04e431bdaefc8356263efc83c8e64efd to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9608a9ab0b391cbdafb6d6d29ec1d0897a95297f3ede8318c55bd2a977b85e36', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '847649e8416434eec9711c10b4b8e32a04e431bdaefc8356263efc83c8e64efd'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 9608a9ab0b391cbdafb6d6d29ec1d0897a95297f3ede8318c55bd2a977b85e36 -> 847649e8416434eec9711c10b4b8e32a04e431bdaefc8356263efc83c8e64efd as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3458 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata)
NOTE: Running task 3459 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3465 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata unihash changed to 4cde4bc6d69342423d6bd048f4404543cc1f7bebd47485c9b872680dfa9451e8
NOTE: Setscene tasks completed
NOTE: Running task 3466 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3467 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Succeeded
NOTE: Running task 3468 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 3469 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 3470 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 3471 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3472 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 3473 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Succeeded
NOTE: Running task 3474 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 3475 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk)
NOTE: Running task 3476 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb)
NOTE: Running task 3477 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Started
NOTE: Running task 3478 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 3479 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_package_spdx)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_package_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_package_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa unihash changed to a586235d030f3d19f0a15aea1e77f1c47f285d26e2b7cdacbbf6ba0a5d7dd0f0
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3480 of 3480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3480 tasks of which 3444 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-src went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-dbg went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-tools went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-ptest went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-staticdev went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-dev went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-doc went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-locale went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: QA Issue: Package version for package libpng went backwards which would break package feeds (from 0:1.6.50-r0 to 0:1.6.48-r0) [version-going-backwards]
ERROR: libpng-1.6.48-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0759600467012984570==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAwMTQzYWE5YzQ5NWIwZDVkMGYwZTlmN2E5Mjg1MzMzMjgzYWI0N2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6MTg6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggOTFiNTc0MGRmMy4uMzUwYTNkMTQyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICJhN2M3ODI2YmNlNWNiYjliOWMzMzdjMTFiOWI3Zjhi
Mjc4ZTc2ZmJhIgorU1JDUkVWID0gIjIzNzYyMjc4NTU0MjJiMDFlZDM2YTFjOWZhODM3MzlmY2U5
NjA1M2QiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============0759600467012984570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a49373d67d61e933a22e56c46a20f9ec41d281b4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a49373d67d61e933a22e56c46a20f9ec41d281b4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 514 Local 502 Mirrors 0 Missed 12 Current 742 (97% match, 99% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3008 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 3448 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 3449 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 3450 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 3451 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3452 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3453 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 3454 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e8d23acc3a828642711b53de3998fde497e214e3fcf8ea7ebc62dc87d2384721
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3455 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 3456 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 3457 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 3458 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3459 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to 780e7778a3853d66d9ae021f08859263b40c30bbc70f8013af6a78bdf240a74e
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 3460 of 3467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3460 tasks of which 3446 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915111657.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915111657.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.1678125
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+2376227855-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.1678125
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============0759600467012984570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles (['= 2:0.0+git0+2376227855-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles-dev (['= 2:0.0+git0+2376227855-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+2376227855

--===============0759600467012984570==--

