Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F29F428CC
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19818.1776261877443292947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fBQoLGpr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uoi/H9lU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91757e99-6314c5ff-de91-4968-b36a-687175a86b0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261889;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bmJOmhNWZIdlI+RtRovHD27TZ1kmyY192Yl0OCWSlxM=;
	b=fBQoLGprd1jUSnDbTovvwlkxzDVMXWJdaR/OMKIJo3O4t7ckBwFMKZ80ec/3HJW+
	nXHc3Lt60LGeJQFKpHXa11VzVC9u8LvfbCYZne5GQi7LxL/cImK+sUosfNSr9VlgZE4
	VHENfWEV+qw+QaU6Z0exgR8UqoHQKImw6dqV57qY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261889;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bmJOmhNWZIdlI+RtRovHD27TZ1kmyY192Yl0OCWSlxM=;
	b=uoi/H9lUuGBAZNVx9KjXV3Ca2IOJSpCULTVNddMUeeT7jXHEnOgd3oZMd/UVPqLo
	aMP8uLv2ZlsOWW/xK+88epgY64G/9ovJ3+zoyUyy/F1t0Ea1GuBGdLtKlrJqs2Nym+F
	n5PIWs3oC7JE2dW3Sd8j0c65ONCqoVmWmIDjJhqY=
Content-Type: multipart/mixed; boundary="===============7481729267692319557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.9.0 SUCCEEDED
Message-ID: <0101019d91757e99-6314c5ff-de91-4968-b36a-687175a86b0e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235277

--===============7481729267692319557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.8.4-1.9.0.patch
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
From 0fe76176bd4135b342672a16fe8d2068f3f3ca70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:51:21 +0000
Subject: [PATCH] libadwaita: upgrade 1.8.4 -> 1.9.0

---
 .../libadwaita/{libadwaita_1.8.4.bb => libadwaita_1.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.8.4.bb => libadwaita_1.9.0.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
index 39423244d9..6236d075fe 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "d02bb77b6f0ff1055002d299898c487cb2d83dbf940d9edf59f6fdf2572a921c"
+SRC_URI[archive.sha256sum] = "817837bf06363db5bbfce66085136eff1436af6625dfabff3ca08b87bfca1b6b"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============7481729267692319557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-ae6405e6f01fd76192ca58a86d12cdcfc4dcfede"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:ae6405e6f01fd76192ca58a86d12cdcfc4dcfede"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1009 Local 975 Mirrors 0 Missed 34 Current 495 (96% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 524 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 631 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 636 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 639 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 646 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 648 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 657 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 670 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 677 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 682 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 686 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 690 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libadwaita-1.9.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 693 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 701 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 705 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 711 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 724 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 733 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 749 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 760 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 800 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 804 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 807 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 813 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 814 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 824 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 831 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 832 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 834 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 835 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 837 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 844 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 846 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 850 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 853 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 855 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 856 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 858 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 860 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 864 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 868 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 869 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 871 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 872 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 874 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 875 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 878 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.86-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 880 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 887 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 894 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 905 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 908 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 910 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 915 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 921 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 922 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 924 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 927 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 928 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 930 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 938 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 943 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 947 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 955 of 1504 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 956 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 959 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 972 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 976 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 989 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 992 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 995 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 998 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 999 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1001 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1003 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1013 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1020 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1504 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1040 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1042 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1049 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1052 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1053 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1057 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1062 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1063 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1066 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1076 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1078 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1079 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1092 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1098 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1099 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1101 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1118 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1119 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1121 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1124 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1128 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1131 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1138 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1139 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1140 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1148 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1149 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1151 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1156 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1157 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1158 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1159 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1166 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1167 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1173 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1174 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1175 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1176 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1177 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1180 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1183 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1189 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1196 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1197 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1198 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1199 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1201 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1207 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1208 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1209 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1210 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1213 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1216 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1218 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1219 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1220 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1221 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1222 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1223 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1225 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1235 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1236 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1238 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1244 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1246 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1247 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1248 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1250 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1251 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1252 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1253 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1254 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1257 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1261 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1262 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1266 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1269 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1270 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1278 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1280 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1282 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1288 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1289 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1290 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1293 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1295 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1296 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1298 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1300 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1301 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1303 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1305 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1306 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1310 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1312 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1314 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1316 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1317 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1319 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1010 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1322 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1330 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1332 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1333 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1158 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1336 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1337 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1339 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1434 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1452 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1539 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1344 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1345 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1346 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1348 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1349 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1350 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1351 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1352 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1353 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1355 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1356 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1357 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1359 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1360 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1361 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1362 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1363 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1364 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1366 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1367 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1368 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1369 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1370 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1372 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1377 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1378 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1385 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1387 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1389 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1390 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1391 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1392 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1393 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1394 of 1504 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1399 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1401 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1402 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1403 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1404 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1405 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1406 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1411 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1412 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1415 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1416 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1419 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1420 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1421 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1423 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1427 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1433 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1436 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1438 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1441 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1442 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1443 of 1504 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1444 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1445 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1446 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1452 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1453 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1454 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1455 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1457 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1458 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1459 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1461 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1465 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1466 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1855 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 1467 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1470 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1471 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1924 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2043 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2108 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_fetch)
NOTE: Running task 2109 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_fetch)
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2155 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Started
NOTE: Running task 2202 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_fetch)
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 2226 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_unpack)
NOTE: Running task 2242 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_write_config)
NOTE: Running task 2243 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_write_config)
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Started
NOTE: Running setscene task 1473 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 2305 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_unpack)
NOTE: Running task 2313 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_unpack)
NOTE: Running task 2318 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_write_config)
NOTE: Running task 2356 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_create_recipe_spdx)
NOTE: Running task 2357 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_create_recipe_spdx)
NOTE: recipe libadwaita-1.9.0-r0: task do_fetch: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_create_recipe_spdx)
NOTE: recipe libadwaita-1.9.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Started
NOTE: Running task 2389 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_write_config: Started
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Started
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1474 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1476 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1478 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2390 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_patch)
NOTE: Running task 2391 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_patch)
NOTE: Running task 2392 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_patch)
NOTE: Running task 2393 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_unpack)
NOTE: Running task 2394 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_unpack: Started
NOTE: recipe appstream-1.1.2-r0: task do_patch: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1480 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1481 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1482 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1484 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1485 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2413 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_patch)
NOTE: recipe appstream-1.1.2-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2416 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.9.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2419 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2420 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libadwaita-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2421 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libadwaita-1.9.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1489 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1491 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1492 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1498 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.9.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1500 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1502 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_deploy_source_date_epoch unihash changed to 5433a6268b13f2313d36ba1ce2892dd82cc301067326a17e67cbd8d51ff4a927
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1501 of 1504 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash cc99ead22725e4744fa7b3e36f495dca533f815892b7420230b315a3af9f9680 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '4fa503bb621d9260c7f9197564077ffebd4c847485c9941fc5692182bc65c4fb', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'cc99ead22725e4744fa7b3e36f495dca533f815892b7420230b315a3af9f9680'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4fa503bb621d9260c7f9197564077ffebd4c847485c9941fc5692182bc65c4fb -> cc99ead22725e4744fa7b3e36f495dca533f815892b7420230b315a3af9f9680 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3072 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3293 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3348 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3439 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_configure)
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3440 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3441 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_configure)
NOTE: Running task 3442 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.22.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash cc99ead22725e4744fa7b3e36f495dca533f815892b7420230b315a3af9f9680 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b7912b764637397a8451f38a69cd6378a0ba851955945788027f759b08e1aadd', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'cc99ead22725e4744fa7b3e36f495dca533f815892b7420230b315a3af9f9680'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b7912b764637397a8451f38a69cd6378a0ba851955945788027f759b08e1aadd -> cc99ead22725e4744fa7b3e36f495dca533f815892b7420230b315a3af9f9680 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Succeeded
NOTE: Running task 3456 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3457 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Started
NOTE: recipe gtk4-4.22.1-r0: task do_configure: Succeeded
NOTE: Running task 3458 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_compile)
NOTE: recipe gtk4-4.22.1-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Succeeded
NOTE: Running task 3459 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3460 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_install)
NOTE: recipe libxmlb-0.3.25-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3461 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_compile)
NOTE: recipe libxmlb-0.3.25-r0: task do_install: Succeeded
NOTE: Running task 3462 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_install_ptest_base)
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3464 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_package)
NOTE: recipe libxmlb-0.3.25-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_package: Succeeded
NOTE: Running task 3465 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.25-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_packagedata unihash changed to 19b4b87301d12853d46a09861d46ad7a1df44d21debde4db9f4bf6f80fadf7bc
NOTE: Setscene tasks completed
NOTE: Running task 3466 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.25-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_create_spdx: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Succeeded
NOTE: Running task 3467 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_install)
NOTE: recipe libfyaml-0.9.4-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_install: Succeeded
NOTE: Running task 3468 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_populate_sysroot)
NOTE: Running task 3469 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_package)
NOTE: recipe libfyaml-0.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_package: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3470 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3471 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_configure)
NOTE: recipe appstream-1.1.2-r0: task do_configure: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_package: Succeeded
NOTE: Running task 3472 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_packagedata)
NOTE: recipe libfyaml-0.9.4-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_packagedata unihash changed to 57d744c481b30723ea7712899b5fc8c3e9d5c08248f1262d935783168eed82f6
NOTE: Setscene tasks completed
NOTE: Running task 3473 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_create_spdx)
NOTE: recipe libfyaml-0.9.4-r0: task do_create_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3474 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_compile)
NOTE: recipe appstream-1.1.2-r0: task do_compile: Started
NOTE: recipe appstream-1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3475 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_install)
NOTE: recipe appstream-1.1.2-r0: task do_install: Started
NOTE: recipe appstream-1.1.2-r0: task do_install: Succeeded
NOTE: Running task 3476 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_package)
NOTE: Running task 3477 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_populate_sysroot)
NOTE: recipe appstream-1.1.2-r0: task do_package: Started
NOTE: recipe appstream-1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_package: Succeeded
NOTE: Running task 3478 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_packagedata)
NOTE: recipe appstream-1.1.2-r0: task do_packagedata: Started
NOTE: recipe appstream-1.1.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_packagedata unihash changed to 3cbc3ceab0de4a43d0c0188ded155aabb1e7385e509d7192b913652fcfe5ac99
NOTE: Setscene tasks completed
NOTE: Running task 3479 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_create_spdx)
NOTE: recipe appstream-1.1.2-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_compile: Succeeded
NOTE: Running task 3480 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_install)
NOTE: recipe gtk4-4.22.1-r0: task do_install: Started
NOTE: recipe gtk4-4.22.1-r0: task do_install: Succeeded
NOTE: Running task 3481 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package)
NOTE: Running task 3482 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.22.1-r0: task do_package: Started
NOTE: recipe gtk4-4.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3483 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3484 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_configure)
NOTE: recipe libadwaita-1.9.0-r0: task do_configure: Started
NOTE: recipe libadwaita-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 3485 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb:do_compile)
NOTE: recipe libadwaita-1.9.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.22.1-r0: task do_package: Succeeded
NOTE: Running task 3486 of 3498 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_packagedata)
NOTE: recipe gtk4-4.22.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.22.1-r0: task do_packagedata: Failed
NOTE: recipe libadwaita-1.9.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3486 tasks of which 3415 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415114957.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415114957.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gtk4/4.22.1/temp/log.do_packagedata.1871236
Summary: There were 124 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-src went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-dbg went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-staticdev went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-dev went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-doc went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ab went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-af went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-am went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-an went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ang went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ar went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-as went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ast went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-az went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-az-ir went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-be went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-be+latin went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bg went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bn went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bn-in went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-br went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bs went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ca went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ca+valencia went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-crh went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-cs went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-cy went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-da went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-de went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-dz went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-el went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en+shaw went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en-ca went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en-gb went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-eo went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-es went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-et went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-eu went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fa went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fi went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fr went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fur went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ga went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-gd went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-gl went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-gu went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-he went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hi went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hr went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hu went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hy went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ia went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-id went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ie went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-io went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-is went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-it went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ja went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ka went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kab went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kk went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-km went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kn went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ko went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ku went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ky went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-lg went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-li went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-lt went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-lv went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mai went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mi went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mjw went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mk went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ml went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mn went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mr went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ms went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-my went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nb went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nds went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ne went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nl went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nn went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nso went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-oc went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-or went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pa went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pl went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ps went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pt went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pt-br went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ro went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ru went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-rw went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-si went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sk went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sl went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sq went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sr went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sr+ije went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sr+latin went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sv went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ta went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-te went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tg went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-th went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tr went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tt went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ug went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-uk went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ur went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-uz went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-uz+cyrillic went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-vi went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-wa went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-xh went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-yi went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-zh-cn went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-zh-hk went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-zh-tw went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: QA Issue: Package version for package gtk4 went backwards which would break package feeds (from 0:4.22.2-r0 to 0:4.22.1-r0) [version-going-backwards]
ERROR: gtk4-4.22.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gtk4/4.22.1/temp/log.do_packagedata.1871236
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_packagedata) failed with exit code '1'

--===============7481729267692319557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: FILELIST: added "/usr/include/libadwaita-1/adw-sidebar-item.h /usr/include/libadwaita-1/adw-sidebar.h /usr/include/libadwaita-1/adw-view-switcher-sidebar.h /usr/include/libadwaita-1/adw-sidebar-section.h"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGSIZE changed from 7495 to 10318 (+38%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGSIZE changed from 6379 to 8797 (+38%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 9447893 to 7811228 (-17%)
Changes to packages/x86-64-v3-poky-linux/libadwaita (sysroot):
  /usr/include/libadwaita-1/adw-sidebar.h was added
  /usr/include/libadwaita-1/adw-sidebar-item.h was added
  /usr/include/libadwaita-1/adw-sidebar-section.h was added
  /usr/include/libadwaita-1/adw-view-switcher-sidebar.h was added

--===============7481729267692319557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.8.4-1.9.0.patch"

RnJvbSAwZmU3NjE3NmJkNDEzNWIzNDI2NzJhMTZmZThkMjA2OGYzZjNjYTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6NTE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuOC40IC0+IDEuOS4wCgotLS0KIC4uLi9saWJhZHdhaXRhL3ts
aWJhZHdhaXRhXzEuOC40LmJiID0+IGxpYmFkd2FpdGFfMS45LjAuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuOC40LmJiID0+IGxpYmFkd2Fp
dGFfMS45LjAuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjguNC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGFfMS45LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjguNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMC5iYgppbmRleCAz
OTQyMzI0NGQ5Li42MjM2ZDA3NWZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
YWR3YWl0YS9saWJhZHdhaXRhXzEuOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS45LjAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICIg
XAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZh
bGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZDAyYmI3
N2I2ZjBmZjEwNTUwMDJkMjk5ODk4YzQ4N2NiMmQ4M2RiZjk0MGQ5ZWRmNTlmNmZkZjI1NzJhOTIx
YyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjgxNzgzN2JmMDYzNjNkYjViYmZjZTY2
MDg1MTM2ZWZmMTQzNmFmNjYyNWRmYWJmZjNjYTA4Yjg3YmZjYTFiNmIiCiAKIEFOWV9PRl9ESVNU
Uk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKLS0gCjIuNDcuMQoK

--===============7481729267692319557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libadwaita: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.8/libadwaita-1.8.4.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.0.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 6191320 to 6226488 (+1%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGSIZE changed from 2525551 to 2697199 (+7%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: FILELIST: added "/usr/include/libadwaita-1/adw-view-switcher-sidebar.h /usr/include/libadwaita-1/adw-sidebar-section.h /usr/include/libadwaita-1/adw-sidebar.h /usr/include/libadwaita-1/adw-sidebar-item.h"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGSIZE changed from 12934 to 13413 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGSIZE changed from 10093 to 10497 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGSIZE changed from 9791 to 10184 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGSIZE changed from 9612 to 9999 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGSIZE changed from 9965 to 9513 (-5%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGSIZE changed from 12689 to 13191 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGSIZE changed from 9272 to 9646 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGSIZE changed from 10064 to 10467 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGSIZE changed from 9825 to 10229 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGSIZE changed from 9848 to 10240 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGSIZE changed from 9704 to 9242 (-5%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGSIZE changed from 9855 to 10713 (+9%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGSIZE changed from 9886 to 10290 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGSIZE changed from 11125 to 11542 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGSIZE changed from 10201 to 10628 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGSIZE changed from 7495 to 10318 (+38%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGSIZE changed from 10437 to 10845 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGSIZE changed from 13575 to 14204 (+5%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGSIZE changed from 6379 to 8797 (+38%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGSIZE changed from 11974 to 12433 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGSIZE changed from 9850 to 10253 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGSIZE changed from 9881 to 10283 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGSIZE changed from 10089 to 10479 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGSIZE changed from 9959 to 10362 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGSIZE changed from 10055 to 10454 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGSIZE changed from 10102 to 10507 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGSIZE changed from 9856 to 10260 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGSIZE changed from 12119 to 12608 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGSIZE changed from 9917 to 10305 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGSIZE changed from 9788 to 9316 (-5%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGSIZE changed from 12109 to 11584 (-4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGSIZE changed from 9611 to 10001 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGSIZE changed from 9578 to 9964 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGSIZE changed from 12274 to 12750 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGSIZE changed from 12669 to 13126 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGSIZE changed from 9222 to 9612 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 9447893 to 7811228 (-17%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: FILELIST: directory renamed /usr/src/debug/libadwaita/1.8.4/src/stylesheet -> /usr/src/debug/libadwaita/1.9.0/src/stylesheet, removed "/usr/src/debug/libadwaita/1.8.4/src/adw-easing.h /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher.c /usr/src/debug/libadwaita/1.8.4/src/adw-spring-params.h /usr/src/debug/libadwaita/1.8.4/src/adw-bidi.c /usr/src/debug/libadwaita/1.8.4/src/adw-clamp-scrollable.c /usr/src/debug/libadwaita/1.8.4/src/adw-switch-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-swipe-tracker-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-spring-params.c /usr/src/debug/libadwaita/1.8.4/src/adw-gtkbuilder-utils.c /usr/src/debug/libadwaita/1.8.4/src/adw-easing.c /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher.h /usr/src/debug/libadwaita/1.8.4/src/adw-clamp-scrollable.h /usr/src/debug/libadwaita/1.8.4/src/adw-switch-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-action-row.h /usr/src/debug/libadwaita/1.8.4/src/a
 dw-breakpoint.c /usr/src/debug/libadwaita/1.8.4/src/adw-dialog-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-dialog.c /usr/src/debug/libadwaita/1.8.4/src/adw-application.c /usr/src/debug/libadwaita/1.8.4/src/adw-clamp.h /usr/src/debug/libadwaita/1.8.4/src/adw-carousel-indicator-lines.h /usr/src/debug/libadwaita/1.8.4/src/adw-action-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-breakpoint.h /usr/src/debug/libadwaita/1.8.4/src/adw-carousel-indicator-lines.c /usr/src/debug/libadwaita/1.8.4/src/adw-clamp.c /usr/src/debug/libadwaita/1.8.4/src/adw-application.h /usr/src/debug/libadwaita/1.8.4/src/adw-dialog.h /usr/src/debug/libadwaita/1.8.4/src/adw-bottom-sheet.h /usr/src/debug/libadwaita/1.8.4/src/adw-banner.c /usr/src/debug/libadwaita/1.8.4/src/adw-shortcut-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-navigation-split-view.c /usr/src/debug/libadwaita/1.8.4/src/adw-banner.h /usr/src/debug/libadwaita/1.8.4/src/adw-bottom-sheet.c /usr/src/debug/libadwaita/1.8.4/src/adw-navigation-spli
 t-view.h /usr/src/debug/libadwaita/1.8.4/src/adw-navigation-view-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-shortcuts-dialog.c /usr/src/debug/libadwaita/1.8.4/src/adw-enums.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-window.c /usr/src/debug/libadwaita/1.8.4/src/adw-enums.c /usr/src/debug/libadwaita/1.8.4/src/adw-shortcuts-dialog.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-window.h /usr/src/debug/libadwaita/1.8.4/src/adw-adaptive-preview-presets-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-application-window.h /usr/src/debug/libadwaita/1.8.4/src/adw-application-window.c /usr/src/debug/libadwaita/1.8.4/src/adw-layout-slot.c /usr/src/debug/libadwaita/1.8.4/src/adw-carousel.h /usr/src/debug/libadwaita/1.8.4/src/adw-password-entry-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-layout-slot.h /usr/src/debug/libadwaita/1.8.4/src/adw-password-entry-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-carousel.c /usr/src/debug/libadwaita/1.8.4/src/adw-animation-target.
 c /usr/src/debug/libadwaita/1.8.4/src/adw-animation-target.h /usr/src/debug/libadwaita/1.8.4/src/adw-gizmo-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-box-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-bar-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-entry-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-combo-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-public-types.c /usr/src/debug/libadwaita/1.8.4/src/adw-layout-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-entry-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-combo-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-settings-impl.c /usr/src/debug/libadwaita/1.8.4/src/adw-wrap-box.h /usr/src/debug/libadwaita/1.8.4/src/adw-toggle-group.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-grid-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-view-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-animation-util.c /usr/src/debug/libadwaita/1.8.4/src/adw-gtkbuilder-utils-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-
 toggle-group.c /usr/src/debug/libadwaita/1.8.4/src/adw-wrap-box.c /usr/src/debug/libadwaita/1.8.4/src/adw-animation-util.h /usr/src/debug/libadwaita/1.8.4/src/adw-settings-impl-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-inline-view-switcher.c /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-group.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-bar.h /usr/src/debug/libadwaita/1.8.4/src/adw-adaptive-preview.c /usr/src/debug/libadwaita/1.8.4/src/adw-breakpoint-bin-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-inline-view-switcher.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-group.c /usr/src/debug/libadwaita/1.8.4/src/adw-tab-bar.c /usr/src/debug/libadwaita/1.8.4/src/adw-tab-box.c /usr/src/debug/libadwaita/1.8.4/src/adw-widget-utils-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-button.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab.c /usr/src/debug/libadwaita/1.8.4/src/adw-message-dialog.h /usr/src/debug/libadwaita/1.8.4/src/adw-breakpoint-private.h /usr/src/d
 ebug/libadwaita/1.8.4/src/adw-message-dialog.c /usr/src/debug/libadwaita/1.8.4/src/adw-color-utils-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-sheet-controls-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-button.c /usr/src/debug/libadwaita/1.8.4/src/adw-resources.c /usr/src/debug/libadwaita/1.8.4/src/adw-animation-target-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-button-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-carousel-indicator-dots.h /usr/src/debug/libadwaita/1.8.4/src/adw-main-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-spin-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-floating-sheet.c /usr/src/debug/libadwaita/1.8.4/src/adw-tab-thumbnail.c /usr/src/debug/libadwaita/1.8.4/src/adw-carousel-indicator-dots.c /usr/src/debug/libadwaita/1.8.4/src/adw-button-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-spin-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-settings-impl-legacy.c /usr/src/debug/libadwaita/
 1.8.4/src/adw-enums-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-style-manager.c /usr/src/debug/libadwaita/1.8.4/src/adw-multi-layout-view-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher-bar.c /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher-button.c /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-dialog.c /usr/src/debug/libadwaita/1.8.4/src/adw-leaflet.c /usr/src/debug/libadwaita/1.8.4/src/adw-toast-widget-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher-bar.h /usr/src/debug/libadwaita/1.8.4/src/adw-animation-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-enums-private.c /usr/src/debug/libadwaita/1.8.4/src/adw-leaflet.h /usr/src/debug/libadwaita/1.8.4/src/adw-style-manager.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-dialog.h /usr/src/debug/libadwaita/1.8.4/src/adw-accent-color-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-back-button.c /usr/src/debug/libadwaita/1.8.4/src/adw-settings-impl-gsettings.c /usr/src/debug/libad
 waita/1.8.4/src/adw-shadow-helper-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-settings-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-shortcuts-section.h /usr/src/debug/libadwaita/1.8.4/src/adw-shortcuts-section.c /usr/src/debug/libadwaita/1.8.4/src/adw-indicator-bin.c /usr/src/debug/libadwaita/1.8.4/src/adw-inspector-page.c /usr/src/debug/libadwaita/1.8.4/src/adw-clamp-layout.h /usr/src/debug/libadwaita/1.8.4/src/adw-marshalers.h /usr/src/debug/libadwaita/1.8.4/src/adw-status-page.h /usr/src/debug/libadwaita/1.8.4/src/adw-dialog-host.c /usr/src/debug/libadwaita/1.8.4/src/adw-marshalers.c /usr/src/debug/libadwaita/1.8.4/src/adw-clamp-layout.c /usr/src/debug/libadwaita/1.8.4/src/adw-status-page.c /usr/src/debug/libadwaita/1.8.4/src/adw-back-button-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-toast-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-shortcuts-item.c /usr/src/debug/libadwaita/1.8.4/src/adw-tab-grid.c
  /usr/src/debug/libadwaita/1.8.4/src/adw-tab-view.c /usr/src/debug/libadwaita/1.8.4/src/adw-version.c /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-shortcuts-item.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-view.h /usr/src/debug/libadwaita/1.8.4/src/adw-flap.h /usr/src/debug/libadwaita/1.8.4/src/adw-main.h /usr/src/debug/libadwaita/1.8.4/src/adw-shadow-helper.c /usr/src/debug/libadwaita/1.8.4/src/adw-toast-overlay.c /usr/src/debug/libadwaita/1.8.4/src/adw-bottom-sheet-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-window.h /usr/src/debug/libadwaita/1.8.4/src/adw-flap.c /usr/src/debug/libadwaita/1.8.4/src/adw-window.c /usr/src/debug/libadwaita/1.8.4/src/adw-main.c /usr/src/debug/libadwaita/1.8.4/src/adw-toast-overlay.h /usr/src/debug/libadwaita/1.8.4/src/adw-expander-row.c /usr/src/debug/libadwaita/1.8.4/src/adw-navigation-view.c /usr/src/debug/libadwaita/1.8.4/src/adw-color-utils.c /usr/src/debug/libadwaita/1.8.4/src/adw-expan
 der-row.h /usr/src/debug/libadwaita/1.8.4/src/adw-navigation-view.h /usr/src/debug/libadwaita/1.8.4/src/adw-shortcut-label-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-swipe-tracker.h /usr/src/debug/libadwaita/1.8.4/src/adw-gizmo.c /usr/src/debug/libadwaita/1.8.4/src/adw-swipe-tracker.c /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher-button-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-animation.h /usr/src/debug/libadwaita/1.8.4/src/adw-layout.c /usr/src/debug/libadwaita/1.8.4/src/adw-spinner.h /usr/src/debug/libadwaita/1.8.4/src/adw-split-button.c /usr/src/debug/libadwaita/1.8.4/src/adw-spinner-paintable.c /usr/src/debug/libadwaita/1.8.4/src/adw-spring-animation.h /usr/src/debug/libadwaita/1.8.4/src/adw-about-window.c /usr/src/debug/libadwaita/1.8.4/src/adw-tab-overview-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-layout.h /usr/src/debug/libadwaita/1.8.4/src/adw-animation.c /usr/src/debug/libadwaita/1.8.4/src/adw-spinner.c /usr/src/debug/libadwaita/1.8.4/src/adw
 -about-window.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-page-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-spinner-paintable.h /usr/src/debug/libadwaita/1.8.4/src/adw-sheet-controls.c /usr/src/debug/libadwaita/1.8.4/src/adw-split-button.h /usr/src/debug/libadwaita/1.8.4/src/adw-spring-animation.c /usr/src/debug/libadwaita/1.8.4/src/adw-multi-layout-view.c /usr/src/debug/libadwaita/1.8.4/src/adw-shortcut-label.h /usr/src/debug/libadwaita/1.8.4/src/adw-fading-label.c /usr/src/debug/libadwaita/1.8.4/src/adw-view-stack.h /usr/src/debug/libadwaita/1.8.4/src/adw-wrap-layout.h /usr/src/debug/libadwaita/1.8.4/src/adw-multi-layout-view.h /usr/src/debug/libadwaita/1.8.4/src/adw-view-stack.c /usr/src/debug/libadwaita/1.8.4/src/adw-wrap-layout.c /usr/src/debug/libadwaita/1.8.4/src/adw-shortcut-label.c /usr/src/debug/libadwaita/1.8.4/src/adw-bin.h /usr/src/debug/libadwaita/1.8.4/src/adw-header-bar.c /usr/src/debug/libadwaita/1.8.4/src/adw-overlay-split-view.h /usr/src/debug/libad
 waita/1.8.4/src/adw-action-row-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-avatar.c /usr/src/debug/libadwaita/1.8.4/src/adw-timed-animation.h /usr/src/debug/libadwaita/1.8.4/src/adw-bin.c /usr/src/debug/libadwaita/1.8.4/src/adw-header-bar.h /usr/src/debug/libadwaita/1.8.4/src/adw-avatar.h /usr/src/debug/libadwaita/1.8.4/src/adw-fading-label-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-floating-sheet-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-overlay-split-view.c /usr/src/debug/libadwaita/1.8.4/src/adw-shortcut-row-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-timed-animation.c /usr/src/debug/libadwaita/1.8.4/src/adw-button-content.c /usr/src/debug/libadwaita/1.8.4/src/adw-length-unit.h /usr/src/debug/libadwaita/1.8.4/src/adw-length-unit.c /usr/src/debug/libadwaita/1.8.4/src/adw-button-content.h /usr/src/debug/libadwaita/1.8.4/src/adw-adaptive-preview-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-overview.c /usr/src/debug/libadwaita/1.8.4/src/adw-toolbar
 -view.c /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher-title.h /usr/src/debug/libadwaita/1.8.4/src/adw-toast-widget.c /usr/src/debug/libadwaita/1.8.4/src/adw-fold-threshold-policy.h /usr/src/debug/libadwaita/1.8.4/src/adw-tab-overview.h /usr/src/debug/libadwaita/1.8.4/src/adw-toolbar-view.h /usr/src/debug/libadwaita/1.8.4/src/adw-view-switcher-title.c /usr/src/debug/libadwaita/1.8.4/src/adw-widget-utils.c /usr/src/debug/libadwaita/1.8.4/src/adw-navigation-direction.h /usr/src/debug/libadwaita/1.8.4/src/adw-indicator-bin-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-page.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-page.c /usr/src/debug/libadwaita/1.8.4/src/adw-window-title.h /usr/src/debug/libadwaita/1.8.4/src/adw-entry-row-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-breakpoint-bin.h /usr/src/debug/libadwaita/1.8.4/src/adw-accent-color.h /usr/src/debug/libadwaita/1.8.4/src/adw-squeezer.h /usr/src/debug/libadwaita/1.8.4/src/adw-breakpoint-bin.c /
 usr/src/debug/libadwaita/1.8.4/src/adw-swipeable.c /usr/src/debug/libadwaita/1.8.4/src/adw-window-title.c /usr/src/debug/libadwaita/1.8.4/src/adw-swipeable.h /usr/src/debug/libadwaita/1.8.4/src/adw-accent-color.c /usr/src/debug/libadwaita/1.8.4/src/adw-bidi-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-preferences-group-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-settings.c /usr/src/debug/libadwaita/1.8.4/src/adw-squeezer.c /usr/src/debug/libadwaita/1.8.4/src/adw-about-dialog.c /usr/src/debug/libadwaita/1.8.4/src/adw-alert-dialog.c /usr/src/debug/libadwaita/1.8.4/src/adw-inspector-page-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-toast.c /usr/src/debug/libadwaita/1.8.4/src/adw-settings-impl-portal.c /usr/src/debug/libadwaita/1.8.4/src/adw-about-dialog.h /usr/src/debug/libadwaita/1.8.4/src/adw-alert-dialog.h /usr/src/debug/libadwaita/1.8.4/src/adw-dialog-host-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-toast.h /usr/src/debug/libadwaita/1.8.4/src/adw-enum-list-mod
 el.c /usr/src/debug/libadwaita/1.8.4/src/adw-tab-thumbnail-private.h /usr/src/debug/libadwaita/1.8.4/src/adw-enum-list-model.h /usr/src/debug/libadwaita/1.8.4/src/adw-style-manager-private.h", added "/usr/src/debug/libadwaita/1.9.0/src/adw-easing.h /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher.c /usr/src/debug/libadwaita/1.9.0/src/adw-spring-params.h /usr/src/debug/libadwaita/1.9.0/src/adw-bidi.c /usr/src/debug/libadwaita/1.9.0/src/adw-clamp-scrollable.c /usr/src/debug/libadwaita/1.9.0/src/adw-switch-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-swipe-tracker-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-spring-params.c /usr/src/debug/libadwaita/1.9.0/src/adw-gtkbuilder-utils.c /usr/src/debug/libadwaita/1.9.0/src/adw-easing.c /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher.h /usr/src/debug/libadwaita/1.9.0/src/adw-clamp-scrollable.h /usr/src/debug/libadwaita/1.9.0/src/adw-switch-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-action-row.h /usr/src/debug/libadwaita/1.
 9.0/src/adw-breakpoint.c /usr/src/debug/libadwaita/1.9.0/src/adw-dialog-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-dialog.c /usr/src/debug/libadwaita/1.9.0/src/adw-application.c /usr/src/debug/libadwaita/1.9.0/src/adw-clamp.h /usr/src/debug/libadwaita/1.9.0/src/adw-carousel-indicator-lines.h /usr/src/debug/libadwaita/1.9.0/src/adw-action-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-breakpoint.h /usr/src/debug/libadwaita/1.9.0/src/adw-carousel-indicator-lines.c /usr/src/debug/libadwaita/1.9.0/src/adw-clamp.c /usr/src/debug/libadwaita/1.9.0/src/adw-application.h /usr/src/debug/libadwaita/1.9.0/src/adw-dialog.h /usr/src/debug/libadwaita/1.9.0/src/adw-bottom-sheet.h /usr/src/debug/libadwaita/1.9.0/src/adw-banner.c /usr/src/debug/libadwaita/1.9.0/src/adw-shortcut-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-navigation-split-view.c /usr/src/debug/libadwaita/1.9.0/src/adw-banner.h /usr/src/debug/libadwaita/1.9.0/src/adw-bottom-sheet.c /usr/src/debug/libadwaita/1.9.0/src/adw-naviga
 tion-split-view.h /usr/src/debug/libadwaita/1.9.0/src/adw-navigation-view-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-shortcuts-dialog.c /usr/src/debug/libadwaita/1.9.0/src/adw-enums.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-window.c /usr/src/debug/libadwaita/1.9.0/src/adw-enums.c /usr/src/debug/libadwaita/1.9.0/src/adw-shortcuts-dialog.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-window.h /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar-item.c /usr/src/debug/libadwaita/1.9.0/src/adw-adaptive-preview-presets-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-application-window.h /usr/src/debug/libadwaita/1.9.0/src/adw-application-window.c /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar-item.h /usr/src/debug/libadwaita/1.9.0/src/adw-layout-slot.c /usr/src/debug/libadwaita/1.9.0/src/adw-carousel.h /usr/src/debug/libadwaita/1.9.0/src/adw-password-entry-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-layout-slot.h /usr/src/debug/libadwaita/1.9.0/src/adw-password-e
 ntry-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-carousel.c /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar.h /usr/src/debug/libadwaita/1.9.0/src/adw-animation-target.c /usr/src/debug/libadwaita/1.9.0/src/adw-animation-target.h /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar.c /usr/src/debug/libadwaita/1.9.0/src/adw-gizmo-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-box-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-bar-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-entry-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-combo-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-public-types.c /usr/src/debug/libadwaita/1.9.0/src/adw-layout-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-entry-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-combo-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-settings-impl.c /usr/src/debug/libadwaita/1.9.0/src/adw-wrap-box.h /usr/src/debug/libadwaita/1.9.0/src/adw-toggle-group.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-grid-private.h /usr
 /src/debug/libadwaita/1.9.0/src/adw-sidebar-section.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-view-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-animation-util.c /usr/src/debug/libadwaita/1.9.0/src/adw-gtkbuilder-utils-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-toggle-group.c /usr/src/debug/libadwaita/1.9.0/src/adw-wrap-box.c /usr/src/debug/libadwaita/1.9.0/src/adw-animation-util.h /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar-section.h /usr/src/debug/libadwaita/1.9.0/src/adw-settings-impl-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-inline-view-switcher.c /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-group.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-bar.h /usr/src/debug/libadwaita/1.9.0/src/adw-adaptive-preview.c /usr/src/debug/libadwaita/1.9.0/src/adw-breakpoint-bin-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-inline-view-switcher.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-group.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-bar.c /usr/
 src/debug/libadwaita/1.9.0/src/adw-tab-box.c /usr/src/debug/libadwaita/1.9.0/src/adw-widget-utils-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-button.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab.c /usr/src/debug/libadwaita/1.9.0/src/adw-message-dialog.h /usr/src/debug/libadwaita/1.9.0/src/adw-breakpoint-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-message-dialog.c /usr/src/debug/libadwaita/1.9.0/src/adw-color-utils-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-sheet-controls-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-button.c /usr/src/debug/libadwaita/1.9.0/src/adw-resources.c /usr/src/debug/libadwaita/1.9.0/src/adw-animation-target-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-button-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-carousel-indicator-dots.h /usr/src/debug/libadwaita/1.9.0/src/adw-main-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-spin-row.h /usr/src/debug/libadwaita/1.9.0/src/a
 dw-floating-sheet.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-thumbnail.c /usr/src/debug/libadwaita/1.9.0/src/adw-carousel-indicator-dots.c /usr/src/debug/libadwaita/1.9.0/src/adw-button-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-spin-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-settings-impl-legacy.c /usr/src/debug/libadwaita/1.9.0/src/adw-enums-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-style-manager.c /usr/src/debug/libadwaita/1.9.0/src/adw-multi-layout-view-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-bar.c /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-button.c /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-dialog.c /usr/src/debug/libadwaita/1.9.0/src/adw-leaflet.c /usr/src/debug/libadwaita/1.9.0/src/adw-toast-widget-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-bar.h /usr/src/debug/libadwaita/1.9.0/src/adw-animation-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-enums-private.c /usr/src/debug/libadwaita/1.9.0/src
 /adw-leaflet.h /usr/src/debug/libadwaita/1.9.0/src/adw-style-manager.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-dialog.h /usr/src/debug/libadwaita/1.9.0/src/adw-accent-color-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-back-button.c /usr/src/debug/libadwaita/1.9.0/src/adw-settings-impl-gsettings.c /usr/src/debug/libadwaita/1.9.0/src/adw-shadow-helper-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-settings-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar-item-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-shortcuts-section.h /usr/src/debug/libadwaita/1.9.0/src/adw-shortcuts-section.c /usr/src/debug/libadwaita/1.9.0/src/adw-indicator-bin.c /usr/src/debug/libadwaita/1.9.0/src/adw-inspector-page.c /usr/src/debug/libadwaita/1.9.0/src/adw-clamp-layout.h /usr/src/debug/libadwaita/1.9.0/src/adw-marshalers.h /usr/src/debug/libadwaita/1.9.0/src/adw-status-page.h /usr/src/debug/libadwaita/1.9.0/src/adw-dialog-host.c /usr/src/debug/libadwaita/1.9.0/src/adw-marshal
 ers.c /usr/src/debug/libadwaita/1.9.0/src/adw-clamp-layout.c /usr/src/debug/libadwaita/1.9.0/src/adw-status-page.c /usr/src/debug/libadwaita/1.9.0/src/adw-back-button-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-toast-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-shortcuts-item.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-grid.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-view.c /usr/src/debug/libadwaita/1.9.0/src/adw-version.c /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-link-row-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-shortcuts-item.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-view.h /usr/src/debug/libadwaita/1.9.0/src/adw-flap.h /usr/src/debug/libadwaita/1.9.0/src/adw-main.h /usr/src/debug/libadwaita/1.9.0/src/adw-shadow-helper.c /usr/src/debug/libadwaita/1.9.0/src/adw-toast-overlay.c /usr/src/debug/libadwaita/1.9.0/src/adw-bottom-sheet-private.h /us
 r/src/debug/libadwaita/1.9.0/src/adw-window.h /usr/src/debug/libadwaita/1.9.0/src/adw-flap.c /usr/src/debug/libadwaita/1.9.0/src/adw-window.c /usr/src/debug/libadwaita/1.9.0/src/adw-main.c /usr/src/debug/libadwaita/1.9.0/src/adw-toast-overlay.h /usr/src/debug/libadwaita/1.9.0/src/adw-expander-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-navigation-view.c /usr/src/debug/libadwaita/1.9.0/src/adw-color-utils.c /usr/src/debug/libadwaita/1.9.0/src/adw-expander-row.h /usr/src/debug/libadwaita/1.9.0/src/adw-navigation-view.h /usr/src/debug/libadwaita/1.9.0/src/adw-shortcut-label-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-sidebar-section-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-swipe-tracker.h /usr/src/debug/libadwaita/1.9.0/src/adw-gizmo.c /usr/src/debug/libadwaita/1.9.0/src/adw-swipe-tracker.c /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-button-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-animation.h /usr/src/debug/libadwaita/1.9.0/src/adw-layout.c /usr/src/
 debug/libadwaita/1.9.0/src/adw-spinner.h /usr/src/debug/libadwaita/1.9.0/src/adw-split-button.c /usr/src/debug/libadwaita/1.9.0/src/adw-spinner-paintable.c /usr/src/debug/libadwaita/1.9.0/src/adw-spring-animation.h /usr/src/debug/libadwaita/1.9.0/src/adw-about-window.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-overview-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-layout.h /usr/src/debug/libadwaita/1.9.0/src/adw-animation.c /usr/src/debug/libadwaita/1.9.0/src/adw-spinner.c /usr/src/debug/libadwaita/1.9.0/src/adw-about-window.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-page-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-spinner-paintable.h /usr/src/debug/libadwaita/1.9.0/src/adw-sheet-controls.c /usr/src/debug/libadwaita/1.9.0/src/adw-split-button.h /usr/src/debug/libadwaita/1.9.0/src/adw-spring-animation.c /usr/src/debug/libadwaita/1.9.0/src/adw-multi-layout-view.c /usr/src/debug/libadwaita/1.9.0/src/adw-shortcut-label.h /usr/src/debug/libadwaita/1.9.0/src/adw-fad
 ing-label.c /usr/src/debug/libadwaita/1.9.0/src/adw-view-stack.h /usr/src/debug/libadwaita/1.9.0/src/adw-wrap-layout.h /usr/src/debug/libadwaita/1.9.0/src/adw-multi-layout-view.h /usr/src/debug/libadwaita/1.9.0/src/adw-view-stack.c /usr/src/debug/libadwaita/1.9.0/src/adw-wrap-layout.c /usr/src/debug/libadwaita/1.9.0/src/adw-shortcut-label.c /usr/src/debug/libadwaita/1.9.0/src/adw-bin.h /usr/src/debug/libadwaita/1.9.0/src/adw-header-bar.c /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-sidebar.h /usr/src/debug/libadwaita/1.9.0/src/adw-overlay-split-view.h /usr/src/debug/libadwaita/1.9.0/src/adw-action-row-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-avatar.c /usr/src/debug/libadwaita/1.9.0/src/adw-timed-animation.h /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-sidebar.c /usr/src/debug/libadwaita/1.9.0/src/adw-bin.c /usr/src/debug/libadwaita/1.9.0/src/adw-header-bar.h /usr/src/debug/libadwaita/1.9.0/src/adw-avatar.h /usr/src/debug/libadwaita/1.9.0/src/adw-fading-lab
 el-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-floating-sheet-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-overlay-split-view.c /usr/src/debug/libadwaita/1.9.0/src/adw-shortcut-row-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-timed-animation.c /usr/src/debug/libadwaita/1.9.0/src/adw-button-content.c /usr/src/debug/libadwaita/1.9.0/src/adw-length-unit.h /usr/src/debug/libadwaita/1.9.0/src/adw-length-unit.c /usr/src/debug/libadwaita/1.9.0/src/adw-button-content.h /usr/src/debug/libadwaita/1.9.0/src/adw-adaptive-preview-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-overview.c /usr/src/debug/libadwaita/1.9.0/src/adw-toolbar-view.c /usr/src/debug/libadwaita/1.9.0/src/adw-view-switcher-title.h /usr/src/debug/libadwaita/1.9.0/src/adw-toast-widget.c /usr/src/debug/libadwaita/1.9.0/src/adw-fold-threshold-policy.h /usr/src/debug/libadwaita/1.9.0/src/adw-tab-overview.h /usr/src/debug/libadwaita/1.9.0/src/adw-toolbar-view.h /usr/src/debug/libadwaita/1.9.0/src/adw-view-sw
 itcher-title.c /usr/src/debug/libadwaita/1.9.0/src/adw-widget-utils.c /usr/src/debug/libadwaita/1.9.0/src/adw-navigation-direction.h /usr/src/debug/libadwaita/1.9.0/src/adw-indicator-bin-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-page.h /usr/src/debug/libadwaita/1.9.0/src/adw-animation-util-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-page.c /usr/src/debug/libadwaita/1.9.0/src/adw-window-title.h /usr/src/debug/libadwaita/1.9.0/src/adw-entry-row-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-breakpoint-bin.h /usr/src/debug/libadwaita/1.9.0/src/adw-accent-color.h /usr/src/debug/libadwaita/1.9.0/src/adw-squeezer.h /usr/src/debug/libadwaita/1.9.0/src/adw-breakpoint-bin.c /usr/src/debug/libadwaita/1.9.0/src/adw-swipeable.c /usr/src/debug/libadwaita/1.9.0/src/adw-window-title.c /usr/src/debug/libadwaita/1.9.0/src/adw-swipeable.h /usr/src/debug/libadwaita/1.9.0/src/adw-accent-color.c /usr/src/debug/libadwaita/1.9.0/src/adw-bidi-private.h /usr/src/debu
 g/libadwaita/1.9.0/src/adw-link-row.c /usr/src/debug/libadwaita/1.9.0/src/adw-preferences-group-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-settings.c /usr/src/debug/libadwaita/1.9.0/src/adw-about-dialog.c /usr/src/debug/libadwaita/1.9.0/src/adw-alert-dialog.c /usr/src/debug/libadwaita/1.9.0/src/adw-inspector-page-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-squeezer.c /usr/src/debug/libadwaita/1.9.0/src/adw-toast.c /usr/src/debug/libadwaita/1.9.0/src/adw-settings-impl-portal.c /usr/src/debug/libadwaita/1.9.0/src/adw-about-dialog.h /usr/src/debug/libadwaita/1.9.0/src/adw-alert-dialog.h /usr/src/debug/libadwaita/1.9.0/src/adw-dialog-host-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-toast.h /usr/src/debug/libadwaita/1.9.0/src/adw-enum-list-model.c /usr/src/debug/libadwaita/1.9.0/src/adw-tab-thumbnail-private.h /usr/src/debug/libadwaita/1.9.0/src/adw-enum-list-model.h /usr/src/debug/libadwaita/1.9.0/src/adw-style-manager-private.h"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGV changed from 1.8.4 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PV changed from "1.8.4" to "1.9.0"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGSIZE changed from 2445996 to 2229300 (-9%)
Changes to packages/x86-64-v3-poky-linux/libadwaita (sysroot):
  /usr/include/libadwaita-1/adw-sidebar.h was added
  /usr/include/libadwaita-1/adw-sidebar-item.h was added
  /usr/include/libadwaita-1/adw-sidebar-section.h was added
  /usr/include/libadwaita-1/adw-view-switcher-sidebar.h was added

--===============7481729267692319557==--

