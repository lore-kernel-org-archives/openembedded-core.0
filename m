Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BE7C47093
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2286.1651434543229087128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=vT6ujZ7j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180812b5b7a-2e6939fb-9300-4e1b-a06e-9bffa054d154-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=NpaK23X0DM1GWTe+Aa6hb8Xl9drSpBcrkv9kWKp+yAg=;
	b=vT6ujZ7jLGnN9nX5lXAimidub6J3NVZ5WV+u2MoN/K6yg6sqnQfYv/55rClAc6G7
	jTq65oK52E2pEPO5188IJBKgBGOLTloobIhYUp6LIdBIuHgGAuESOeSGzZC3LIbLseU
	gbQDf2LlV6yHGw4W8vKb+Y+0aneHrAk8pBGIaKVA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=NpaK23X0DM1GWTe+Aa6hb8Xl9drSpBcrkv9kWKp+yAg=;
	b=M/esH7EG8nlvItC4OO9ytLPyhsuY8WGwL2xmdK3psAoPD03XqK7QJAaQLL79lp78
	Xfz1M7cUAojFbzpWn58+6jaADF3wYACLEu8UqPzhNlqGdsfxqNT3f+3+b4yyXefSAHe
	UUaui+r3SXl35lo87V68HhkshK/RJ3b0+d+NoL9Q=
Content-Type: multipart/mixed; boundary="===============9128433503251317646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.1 SUCCEEDED
Message-ID: 
 <01010180812b5b7a-2e6939fb-9300-4e1b-a06e-9bffa054d154-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165146

--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.0-22.1.1.patch
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
--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 54 recipes from the core2-32 sysroot...done.
Removing 53 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a1a21751b21ce3309114186ff469ed0d3520c9ad"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a1a21751b21ce3309114186ff469ed0d3520c9ad"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 239 Local 207 Mirrors 0 Missed 32 Current 174 (86% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 186 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 723 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 746 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 753 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 755 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 756 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 807 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 808 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 809 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 812 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe freetype-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 813 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: Running task 814 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 815 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 816 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 817 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 818 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 819 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: Running setscene task 223 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running setscene task 225 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: Running setscene task 227 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 230 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 834 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 836 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 837 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 838 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 840 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 845 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 846 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 233 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 847 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 848 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 849 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 850 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 851 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 852 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 24fb53b962820be361bab2418ea6c6d94be33d1b3ed7a146bb51f827080abf5a
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 234 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 237 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 248 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 254 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 256 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 261 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 264 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 272 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libx11/1_1.7.5-r0/temp/log.do_packagedata_setscene.337180
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 291 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_package_setscene)
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 320 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 345 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xorgproto/2021.5-r0/temp/log.do_packagedata_setscene.340284
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 376 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 380 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1254 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: Running task 1351 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1411 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1412 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1413 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Started
NOTE: Running task 1414 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1435 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1436 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1437 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1438 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1439 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1440 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1441 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1443 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1444 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1445 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1447 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1448 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1451 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1454 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1457 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1458 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1459 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1460 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1464 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1466 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1468 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1469 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1470 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1471 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1472 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1474 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1477 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1478 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1479 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1480 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1481 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1481 tasks of which 1395 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a1a21751b21ce3309114186ff469ed0d3520c9ad"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a1a21751b21ce3309114186ff469ed0d3520c9ad"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 20 Mirrors 0 Missed 32 Current 362 (38% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 365 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1117 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1141 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1157 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1175 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1177 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1269 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1276 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1281 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1292 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: Running task 1296 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1297 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1298 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1299 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1300 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1301 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1303 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1304 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libx11/1_1.7.5-r0/temp/log.do_packagedata_setscene.254010
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_package_setscene)
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1311 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1312 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1313 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1314 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1315 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1316 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1318 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1319 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1320 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1321 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1323 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1324 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 24fb53b962820be361bab2418ea6c6d94be33d1b3ed7a146bb51f827080abf5a
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 1326 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 411 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xorgproto/2021.5-r0/temp/log.do_packagedata_setscene.255228
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1407 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1422 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata)
NOTE: Running task 1423 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1403 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.0.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.1.tar.xz"
packages/core2-32-poky-linux/xwayland: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10260728 to 10261492 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8588100 to 8589131 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.0" to "22.1.1"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.0 [default] to 22.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.0" to "22.1.1"

--===============9128433503251317646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.0-22.1.1.patch"

From 2573eae5ea72966e8797c674a3ce0b78846173b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 15:42:19 +0000
Subject: [PATCH] xwayland: upgrade 22.1.0 -> 22.1.1

---
 .../xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
index 9769235ce6..b512b9932d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1752d6d0a930e71292b5a308d3811ebd54d8cc68cacff44de654265b8617a2bf"
+SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.27.0


--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a1a21751b21ce3309114186ff469ed0d3520c9ad"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a1a21751b21ce3309114186ff469ed0d3520c9ad"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 20 Mirrors 0 Missed 32 Current 362 (38% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 365 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1117 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1141 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1157 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1176 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1177 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1269 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1276 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1281 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1292 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: Running task 1297 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1298 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1299 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1300 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1301 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1303 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1304 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libx11/1_1.7.5-r0/temp/log.do_packagedata_setscene.280586
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_package_setscene)
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1311 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1312 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1313 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1314 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1315 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1316 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1318 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1319 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1320 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1321 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1322 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1323 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1324 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 24fb53b962820be361bab2418ea6c6d94be33d1b3ed7a146bb51f827080abf5a
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 1326 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 411 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xorgproto/2021.5-r0/temp/log.do_packagedata_setscene.281805
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: Running task 1407 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1422 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1423 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1403 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a1a21751b21ce3309114186ff469ed0d3520c9ad"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a1a21751b21ce3309114186ff469ed0d3520c9ad"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 20 Mirrors 0 Missed 32 Current 362 (38% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 365 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1116 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1141 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1156 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1175 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1177 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1269 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1276 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1280 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1292 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: Running task 1296 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1297 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1298 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1299 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1300 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 1301 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1303 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1304 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libx11/1_1.7.5-r0/temp/log.do_packagedata_setscene.307175
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_package_setscene)
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1312 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1313 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1314 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1315 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1316 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1318 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1319 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1320 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1321 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1322 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1323 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1324 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 24fb53b962820be361bab2418ea6c6d94be33d1b3ed7a146bb51f827080abf5a
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1326 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 411 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xorgproto/2021.5-r0/temp/log.do_packagedata_setscene.308392
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: Running task 1407 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1422 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1423 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1403 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9128433503251317646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a1a21751b21ce3309114186ff469ed0d3520c9ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a1a21751b21ce3309114186ff469ed0d3520c9ad"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 20 Mirrors 0 Missed 32 Current 362 (38% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 365 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1117 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1141 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1157 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1175 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1178 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: Running task 1269 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_fetch)
NOTE: Running task 1276 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1278 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1292 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_write_config)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1297 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1298 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1299 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1300 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 1301 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_unpack)
NOTE: Running task 1302 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1303 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 1304 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libx11/1_1.7.5-r0/temp/log.do_packagedata_setscene.227586
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_package_setscene)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1312 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: Running task 1313 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: Running task 1314 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: Running task 1315 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_patch)
NOTE: Running task 1316 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1318 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1319 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1320 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1321 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1322 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1323 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1324 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_lic unihash changed to 24fb53b962820be361bab2418ea6c6d94be33d1b3ed7a146bb51f827080abf5a
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1325 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 1326 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 411 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xorgproto/2021.5-r0/temp/log.do_packagedata_setscene.228806
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 413 of 414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1407 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1411 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1422 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1423 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1445 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1450 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1452 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1453 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1455 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1459 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1460 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1467 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1471 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_configure)
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_compile)
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_install)
NOTE: recipe xwayland-22.1.1-r0: task do_install: Started
NOTE: recipe xwayland-22.1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package)
NOTE: Running task 1485 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_write_rpm)
NOTE: Running task 1488 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_package_qa)
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1489 of 1489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1489 tasks of which 1403 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8-r0 to 1:1.7.5-r0) [version-going-backwards]
ERROR: libx11-1_1.7.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2022.1-r0 to 0:2021.5-r0) [version-going-backwards]
ERROR: xorgproto-2021.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9128433503251317646==--

